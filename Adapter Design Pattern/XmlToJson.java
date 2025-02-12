class JSONAnalyticsTool {
    private String jsonData;

    public void setJsonData(String jsonData) {
        this.jsonData = jsonData;
    }

    public void analyzeData() {
        if (jsonData != null && jsonData.contains("json")) {
            System.out.println("Analyzing JSON Data - " + jsonData);
        } else {
            System.out.println("Not in the correct format. Can't analyze!");
        }
    }
}

interface AnalyticsTool {
    void analyzeData();
}

class XMLToJSONAdapter implements AnalyticsTool {
    private JSONAnalyticsTool jsonAnalyticsTool;

    public XMLToJSONAdapter(String xmlData) {
        System.out.println("Converting the XML Data '" + xmlData + "' to JSON Data!");
        String newData = convertXmlToJson(xmlData);
        jsonAnalyticsTool = new JSONAnalyticsTool();
        jsonAnalyticsTool.setJsonData(newData);
    }

    private String convertXmlToJson(String xmlData) {
        // Simulating XML to JSON conversion (in real-world, use a library like org.json or Jackson)
        return "{ \"data\": \"" + xmlData + "\" } in json";
    }

    @Override
    public void analyzeData() {
        jsonAnalyticsTool.analyzeData();
    }
}

public class XmlToJson {
    public static void main(String[] args) {
        String xmlData = "Sample Data";

        // Directly analyzing JSON data (incorrect format case)
        JSONAnalyticsTool tool1 = new JSONAnalyticsTool();
        tool1.setJsonData(xmlData);
        tool1.analyzeData();

        System.out.println("----------------------------------------------");

        // Using Adapter to convert XML to JSON and analyze it
        AnalyticsTool tool2 = new XMLToJSONAdapter(xmlData);
        tool2.analyzeData();
    }
}
