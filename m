From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH v2 3/4] toshiba_acpi: Refactor *{get, set} functions
 return value
Date: Tue, 28 Jul 2015 20:35:21 -0700
Message-ID: <20150729033521.GA3171@vmdeb7>
References: <1438046548-3081-1-git-send-email-coproscefalo@gmail.com>
 <1438046548-3081-5-git-send-email-coproscefalo@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1438046548-3081-5-git-send-email-coproscefalo@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Azael Avalos <coproscefalo@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Mon, Jul 27, 2015 at 07:22:27PM -0600, Azael Avalos wrote:
> This patch changes the default return value of the driver *{get, set}
> functions from 0 (success) to -EIO, since the driver default error
> value is -EIO.
> 
> All the functions now check for TOS_FAILURE, TOS_NOT_SUPPORTED and
> TOS_SUCCESS.
> 
> On TOS_FAILURE a pr_err message is printed informing the user of the
> error (no change was made to this, except the check was added to the
> functions not checking for this).
> 
> On TOS_NOT_SUPPORTED we now return -ENODEV immediately (some
> functions were returning -EIO)
> 
> On TOS_SUCCESS we now return 0, as a side effect, a new success value
> was added, since some functions return one instead of zero to
> indicate success.
> 
> As a special case, the LED functions only check for TOS_FAILURE on
> *set, and check for TOS_FAILURE and TOS_SUCCESS on *get with their
> default return value set to LED_OFF.
> 
> Also the {lcd, video}_proc* functions were adapted to reflect these
> changes to their parent HCI functions.
> 
> Signed-off-by: Azael Avalos <coproscefalo@gmail.com>
> ---
>  drivers/platform/x86/toshiba_acpi.c | 432 ++++++++++++++++++------------------
>  1 file changed, 217 insertions(+), 215 deletions(-)
> 
> diff --git a/drivers/platform/x86/toshiba_acpi.c b/drivers/platform/x86/toshiba_acpi.c
> index e24f0f5..0034341 100644
> --- a/drivers/platform/x86/toshiba_acpi.c
> +++ b/drivers/platform/x86/toshiba_acpi.c
> @@ -93,6 +93,7 @@ MODULE_LICENSE("GPL");
>  
>  /* Return codes */
>  #define TOS_SUCCESS			0x0000
> +#define TOS_SUCCESS2			0x0001

UGH, thanks Toshiba :-(

>  #define TOS_OPEN_CLOSE_OK		0x0044
>  #define TOS_FAILURE			0x1000
>  #define TOS_NOT_SUPPORTED		0x8000
> @@ -467,7 +468,8 @@ static void toshiba_illumination_set(struct led_classdev *cdev,
>  {
>  	struct toshiba_acpi_dev *dev = container_of(cdev,
>  			struct toshiba_acpi_dev, led_dev);
> -	u32 state, result;
> +	u32 result;
> +	u32 state;
>  

I should add that this is a apparently a preference of mine, and other
maintainers do not enforce this, some actively discourage it. I apologize for
this inconsistency among the maintainers, it came to my attention that the very
person I was modeling this preference after in fact feels the opposite. Sigh.
For the time being, we stick with the preference I've stated, for consistency
within this file and through drivers/platform/x86 if nothing else.

>  	/* First request : initialize communication. */
>  	if (!sci_open(dev))
> @@ -479,8 +481,6 @@ static void toshiba_illumination_set(struct led_classdev *cdev,
>  	sci_close(dev);
>  	if (result == TOS_FAILURE)
>  		pr_err("ACPI call for illumination failed\n");
> -	else if (result == TOS_NOT_SUPPORTED)
> -		return;
>  }
>  
>  static enum led_brightness toshiba_illumination_get(struct led_classdev *cdev)
> @@ -496,14 +496,12 @@ static enum led_brightness toshiba_illumination_get(struct led_classdev *cdev)
>  	/* Check the illumination */
>  	result = sci_read(dev, SCI_ILLUMINATION, &state);
>  	sci_close(dev);
> -	if (result == TOS_FAILURE || result == TOS_INPUT_DATA_ERROR) {
> +	if (result == TOS_FAILURE)
>  		pr_err("ACPI call for illumination failed\n");
> -		return LED_OFF;
> -	} else if (result == TOS_NOT_SUPPORTED) {
> -		return LED_OFF;
> -	}
> +	else if (result == TOS_SUCCESS)
> +		return state ? LED_FULL : LED_OFF;
>  

I believe it is more typical, and therefor more natural to my eye, to test for
failure.

else if (result != TOS_SUCCESS)
	return LED_OFF;

return state ? LED_FULL : LED_OFF;
}

Applies throughout. However, there is of course no functional difference and
others may argue differently. I'm mentioning it because there is an issue that
requires a respin below. I'll leave it to you which way you want to handle this
in this driver.

...

>  
>  static int video_proc_show(struct seq_file *m, void *v)
>  {
>  	struct toshiba_acpi_dev *dev = m->private;
>  	u32 value;
> -	int ret;
>  
> -	ret = get_video_status(dev, &value);
> -	if (!ret) {
> -		int is_lcd = (value & HCI_VIDEO_OUT_LCD) ? 1 : 0;
> -		int is_crt = (value & HCI_VIDEO_OUT_CRT) ? 1 : 0;
> -		int is_tv = (value & HCI_VIDEO_OUT_TV) ? 1 : 0;
> +	if (get_video_status(dev, &value))
> +		return -EIO;
>  
> -		seq_printf(m, "lcd_out:                 %d\n", is_lcd);
> -		seq_printf(m, "crt_out:                 %d\n", is_crt);
> -		seq_printf(m, "tv_out:                  %d\n", is_tv);
> -	}
> +	int is_lcd = (value & HCI_VIDEO_OUT_LCD) ? 1 : 0;

In this case, these need to be defined above. Your build test should have caught
this:

drivers/platform/x86/toshiba_acpi.c:1292:2: warning: ISO C90 forbids mixed declarations and code [-Wdeclaration-after-statement]
  int is_lcd = (value & HCI_VIDEO_OUT_LCD) ? 1 : 0;
  ^

Did it not?

...

Thanks,

-- 
Darren Hart
Intel Open Source Technology Center
