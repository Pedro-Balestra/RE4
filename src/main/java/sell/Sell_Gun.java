package sell;

import dao.ConnectionDAO;
import items.Gun;
import items.Item;
import people.Player;

import java.sql.SQLException;

public class Sell_Gun extends ConnectionDAO {

    boolean sucesso = false;

    //Método para vender uma arma
    public boolean sell_gun(Item item, Player player){

        connectToDB();
        String sql = "DELETE FROM Item WHERE idItem = ?;";

        try{

            pst = con.prepareStatement(sql);
            pst.setInt(1, item.idItem);
            pst.execute();
            sucesso = true;

            player.pasetas += item.valueItem;
            System.out.println("Pasetas C/ venda = " + player.pasetas);

        } catch(SQLException exc){
            System.out.println("Erro: " + exc.getMessage());
            sucesso = false;

        } finally {
            try {
                con.close();
                pst.close();
            } catch(SQLException exc) {
                System.out.println("Erro: " + exc.getMessage());
            }
        }

        return sucesso;
    }
}
