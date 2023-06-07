import org.junit.Test;
import org.junit.Before;
import org.junit.After;

import static org.hamcrest.CoreMatchers.is;
import static org.hamcrest.core.IsNot.not;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.Dimension;
import org.openqa.selenium.chrome.ChromeOptions;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;
import java.util.*;

public class SuccessfulAddBlogPostTest {
  private WebDriver driver;
  private Map<String, Object> vars;
  private JavascriptExecutor js;

  @Before
  public void setUp() {
    String driverPath = System.getProperty("user.dir") + "/src/test/chromedriver/chromedriver.exe";
    System.setProperty("webdriver.chrome.driver", driverPath);
    ChromeOptions options = new ChromeOptions();
    options.addArguments("--headless");
    driver = new ChromeDriver(options);
    js = (JavascriptExecutor) driver;
    vars = new HashMap<String, Object>();
  }

  @After
  public void tearDown() {
    if (driver != null) {
      driver.quit();
    }
  }

  @Test
  public void successfulAddBlogPost() {
    driver.get("http://127.0.0.1:7000/");
    driver.manage().window().setSize(new Dimension(974, 1040));

    WebDriverWait wait = new WebDriverWait(driver, 10);

    wait.until(ExpectedConditions.visibilityOfElementLocated(By.linkText("Sign in")));
    driver.findElement(By.linkText("Sign in")).click();

    wait.until(ExpectedConditions.visibilityOfElementLocated(By.id("sign-in__email")));
    driver.findElement(By.id("sign-in__email")).click();
    driver.findElement(By.id("sign-in__email")).sendKeys("psarevandrej325@gmail.com");

    wait.until(ExpectedConditions.visibilityOfElementLocated(By.id("sign-in__password")));
    driver.findElement(By.id("sign-in__password")).click();
    driver.findElement(By.id("sign-in__password")).sendKeys("Fylhtq2001!");

    wait.until(ExpectedConditions.visibilityOfElementLocated(By.cssSelector(".form__button")));
    driver.findElement(By.cssSelector(".form__button")).click();

    wait.until(ExpectedConditions.visibilityOfElementLocated(By.linkText("Read more")));
    driver.findElement(By.linkText("Read more")).click();

    wait.until(ExpectedConditions.visibilityOfElementLocated(By.cssSelector(".comment-form__textarea")));
    driver.findElement(By.cssSelector(".comment-form__textarea")).click();
    driver.findElement(By.cssSelector(".comment-form__textarea")).sendKeys("new comment");

    wait.until(ExpectedConditions.visibilityOfElementLocated(By.cssSelector(".comment-form__button:nth-child(1)")));
    driver.findElement(By.cssSelector(".comment-form__button:nth-child(1)")).click();
  }
}
