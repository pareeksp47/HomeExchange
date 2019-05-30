/**
 * 
 */
package com.exchange.isep.repository;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.exchange.isep.model.Apartment;
import com.exchange.isep.model.Room;
import com.exchange.isep.model.Sensor;

/**
 * @author SAURABH
 *
 */
@Repository
public class UserDashboardRepository {
	
	@Autowired
    private JdbcTemplate jdbcTemplate;
	
	/**
	 * 
	 * @param roomId
	 * @return
	 * @throws Exception
	 */
	public List<Sensor> sensors(int roomId) throws Exception{
		
		List<Sensor> sensors = null;
		
		 sensors = jdbcTemplate.query(
                "SELECT * FROM Sensor where Room_Id = ?", new Object[] {roomId}, 
                (rs, rowNum) -> new Sensor(rs.getInt("id"),
                        rs.getString("name"), rs.getString("status"))
        );

        return sensors;
	}
	
	/**
	 * 
	 * @param apartmentId
	 * @return
	 * @throws Exception
	 */
	public List<Room> rooms(int apartmentId) throws Exception{
		
		List<Room> rooms = null;
		
		 rooms = jdbcTemplate.query(
               "SELECT * FROM Room where Apartment_Id = ? ", new Object[] {apartmentId},
               (rs, rowNum) -> new Room(rs.getInt("Id"),
                       rs.getString("Name"), rs.getInt("Apartment_id"),
               		   rs.getString("Room_Type"))
       );

       return rooms;
	}
	
	/**
	 * 
	 * @param userId
	 * @return
	 * @throws Exception
	 */
	public List<Apartment> apartments(int userId) throws Exception{
		
		List<Apartment> apartments = null;
		
		 apartments = jdbcTemplate.query(
               "SELECT * FROM Apartment where user_id = ?", new Object[] {userId},
               (rs, rowNum) -> new Apartment(rs.getInt("id"),
                       rs.getString("name"), rs.getInt("User_Id"),
                       rs.getString("house_Name"),rs.getString("street"),
                       rs.getString("city"),rs.getString("country"),
                       rs.getString("ZipCode"))
       );

       return apartments;
	}
	
	
	// Add new sensor
    /**
     * 
     * @param sensor
     */
    public void addSensor(Sensor sensor) {

        jdbcTemplate.update("INSERT INTO sensor(name, status) VALUES (?,?)",
                sensor.getName(),sensor.getStatus());

    }
    
 // Add new room
    /**
     * 
     * @param room
     */
    public void addRoom(Room room) {

        jdbcTemplate.update("INSERT INTO room(name, status) VALUES (?,?,?)",
                room.getName(),room.getApartmentId(), room.getRoomType());

    }
    
 // Add new apartment
    /**
     * 
     * @param apartment
     */
    public void addApartment(Apartment apt) {

        jdbcTemplate.update("INSERT INTO apartment(name, user_id, house_name, street, city, country, zipcode ) VALUES (?,?,?,?,?,?,?)",
                apt.getName(),apt.getUserId(), apt.getApartmentRole(), apt.getHouseName(), apt.getStreet(), apt.getCity(), apt.getCountry(), apt.getZipCode());

    }

}