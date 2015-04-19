package nasacropalert
import jxl.LabelCell
import jxl.Sheet
import jxl.Workbook

class TipsController {
    def index() {
    def file = request.getFile('data')
    Workbook workbook = Workbook.getWorkbook(file.getInputStream());
    Sheet sheet = workbook.getSheet(0);
    // skip first row (row 0) by starting from 1
    for(int row = 1; row<sheet.getRows();row++){
        LabelCell cropName =  sheet.getCell(0, row)
        LabelCell disease = sheet.getCell(1, row)
        LabelCell symptoms =  sheet.getCell(2, row)
        LabelCell cause=sheet.getCell(3,row)
        LabelCell control = sheet.getCell(4, row)
        LabelCell pesticide = sheet.getCell(5, row)
        def tips=new Tips(cropName: cropName.string, disease: disease.string, symptoms: symptoms.string,cause: cause.string,control: control.string, pesticide: pesticide.string)
        tips.save(flush: true)
    }
}
    def getTips(Integer max){
        params.max = Math.min(max ?: 4, 5)
        /*println Tips.list().cropName*/
        render view:'ExpertTips',model: [tipsList: Tips.list(params), tipsTotal:Tips.count()]
    }
    def addNewTips(){

    }
    def saveTips(){
        def tips=new Tips(params)
        tips.save(flush: true)
        redirect(action: 'getTips')

    }
    def searchTips(Integer max){
        params.max = Math.min(max ?: 4, 5)
        String keyWord=params.keySearch
        String wSearch=params.wSearch
        def tipsList=new Tips()
        if(wSearch.equalsIgnoreCase("disease")){
            tipsList=Tips.findAllByDiseaseIlike('%'+keyWord+'%',params)
        }else{
            tipsList=Tips.findAllByCropNameIlike('%'+keyWord+'%',params)
        }
        render view:'searchResultTips',model: [tipsList: tipsList,totalTips:tipsList.size()]

    }
}
