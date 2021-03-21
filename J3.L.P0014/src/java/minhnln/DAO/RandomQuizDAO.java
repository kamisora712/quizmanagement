/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package minhnln.DAO;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import minhnln.DTO.AnswerDTO;
import minhnln.DTO.QuestionDTO;
import minhnln.DTO.RandomQuizDTO;

/**
 *
 * @author Welcome
 */
public class RandomQuizDAO implements Serializable {

    QuestionDAO Qdao = new QuestionDAO();
    AnswerDAO Adao = new AnswerDAO();

    public List<QuestionDTO> displayQuestionInRandomList(int RandomID, List<RandomQuizDTO> RQlist) throws Exception {
        List<QuestionDTO> Qlist = new ArrayList<>();
        String questionID = "";
        String questionContent = "";
        for (int i = 0; i < RQlist.size(); i++) {
            questionID = RQlist.get(RandomID - 1).getQuestionID();
            questionContent = Qdao.getContentBaseID(questionID, Qdao.getAllQuestion());
        }
        Qlist.add(new QuestionDTO(questionID, questionContent));
        return Qlist;
    }

    public void setChoseAnswerID(String choseAnswerID, int QuestionPos, List<RandomQuizDTO> RQlist) throws Exception {
        for (int i = 0; i < RQlist.size(); i++) {
            RQlist.get(QuestionPos - 1).setChoseAnswerID(choseAnswerID);
        }
    }

    public float getMark(int NumofQuestion, List<RandomQuizDTO> RQlist) throws Exception {
        float MarkPerQuestion = 10 / NumofQuestion;
        int CorrectAnswer = 0;
        float Mark = 0;
        List<AnswerDTO> Alist = Adao.getAllCorrentAnswer();
        for (int i = 0; i < Alist.size(); i++) {
            for (int j = 0; j < RQlist.size(); j++) {
                if (Alist.get(i).getAnswerID().equals(RQlist.get(j).getChoseAnswerID())) {
                    CorrectAnswer++;
                }
            }
        }
        Mark = CorrectAnswer * MarkPerQuestion;
        return Mark;
    }
}
