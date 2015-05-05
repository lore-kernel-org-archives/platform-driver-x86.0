From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH v2 3/5] toshiba_acpi: Cleanup blank lines after comment
 blocks
Date: Tue, 5 May 2015 14:24:16 -0700
Message-ID: <20150505212416.GB33724@fury.dvhart.com>
References: <1430759758-4026-1-git-send-email-coproscefalo@gmail.com>
 <1430759758-4026-4-git-send-email-coproscefalo@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:50630 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1945943AbbEEVYR (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 5 May 2015 17:24:17 -0400
Content-Disposition: inline
In-Reply-To: <1430759758-4026-4-git-send-email-coproscefalo@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Azael Avalos <coproscefalo@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, May 04, 2015 at 11:15:56AM -0600, Azael Avalos wrote:
> This patch removes some blank lines after comment blocks, capitalizes
> some comments first words and adds a few comments to the beggining
> of some functions.
> 
> Signed-off-by: Azael Avalos <coproscefalo@gmail.com>
> ---
>  drivers/platform/x86/toshiba_acpi.c | 31 +++++++++++++++++--------------
>  1 file changed, 17 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/platform/x86/toshiba_acpi.c b/drivers/platform/x86/toshiba_acpi.c
> index 19efb05..dca3dd2 100644
> --- a/drivers/platform/x86/toshiba_acpi.c
> +++ b/drivers/platform/x86/toshiba_acpi.c
> @@ -78,10 +78,9 @@ MODULE_LICENSE("GPL");
>   * SCI stands for "System Configuration Interface" which aim is to
>   * conceal differences in hardware between different models.
>   */
> -
>  #define TCI_WORDS			6
>  
> -/* operations */
> +/* Operations */

I don't object - but just for the record. I care about Sentence formatting when
using sentences and multiline comments, not so much for single word or one line
phrases.

Be consistent within the file, that matters most.

>  #define HCI_SET				0xff00
>  #define HCI_GET				0xfe00
>  #define SCI_OPEN			0xf100
> @@ -89,7 +88,7 @@ MODULE_LICENSE("GPL");
>  #define SCI_GET				0xf300
>  #define SCI_SET				0xf400
>  
> -/* return codes */
> +/* Return codes */
>  #define TOS_SUCCESS			0x0000
>  #define TOS_OPEN_CLOSE_OK		0x0044
>  #define TOS_FAILURE			0x1000
> @@ -104,7 +103,7 @@ MODULE_LICENSE("GPL");
>  #define TOS_NOT_INITIALIZED		0x8d50
>  #define TOS_NOT_INSTALLED		0x8e00
>  
> -/* registers */
> +/* Registers */
>  #define HCI_FAN				0x0004
>  #define HCI_TR_BACKLIGHT		0x0005
>  #define HCI_SYSTEM_EVENT		0x0016
> @@ -126,7 +125,7 @@ MODULE_LICENSE("GPL");
>  #define SCI_TOUCHPAD			0x050e
>  #define SCI_KBD_FUNCTION_KEYS		0x0522
>  
> -/* field definitions */
> +/* Field definitions */
>  #define HCI_ACCEL_MASK			0x7fff
>  #define HCI_HOTKEY_DISABLE		0x0b
>  #define HCI_HOTKEY_ENABLE		0x09
> @@ -272,7 +271,6 @@ static const struct dmi_system_id toshiba_vendor_backlight_dmi[] = {
>  /*
>   * Utility
>   */
> -

I'd keep the space, just as you will keep a space between _set_bit and functions
that follow it.

>  static inline void _set_bit(u32 *word, u32 mask, int value)
>  {
>  	*word = (*word & ~mask) | (mask * value);
> @@ -281,7 +279,6 @@ static inline void _set_bit(u32 *word, u32 mask, int value)
>  /*
>   * ACPI interface wrappers
>   */
> -
>  static int write_acpi_int(const char *methodName, int val)
>  {
>  	acpi_status status;
> @@ -331,7 +328,6 @@ static acpi_status tci_raw(struct toshiba_acpi_dev *dev,
>   * In addition to the ACPI status, the HCI system returns a result which
>   * may be useful (such as "not supported").
>   */
> -
>  static u32 hci_write(struct toshiba_acpi_dev *dev, u32 reg, u32 in1)
>  {
>  	u32 in[TCI_WORDS] = { HCI_SET, reg, in1, 0, 0, 0 };
> @@ -358,7 +354,6 @@ static u32 hci_read(struct toshiba_acpi_dev *dev, u32 reg, u32 *out1)
>  /*
>   * Common sci tasks
>   */
> -
>  static int sci_open(struct toshiba_acpi_dev *dev)
>  {
>  	u32 in[TCI_WORDS] = { SCI_OPEN, 0, 0, 0, 0, 0 };
> @@ -1183,6 +1178,7 @@ static int toshiba_hotkey_event_type_get(struct toshiba_acpi_dev *dev,
>  	return 0;
>  }
>  
> +/* Transflective Backlight */
>  static int get_tr_backlight_status(struct toshiba_acpi_dev *dev, bool *enabled)
>  {
>  	u32 hci_result;
> @@ -1204,6 +1200,7 @@ static int set_tr_backlight_status(struct toshiba_acpi_dev *dev, bool enable)
>  
>  static struct proc_dir_entry *toshiba_proc_dir /*= 0*/;
>  
> +/* LCD Brightness */
>  static int __get_lcd_brightness(struct toshiba_acpi_dev *dev)
>  {
>  	u32 hci_result;
> @@ -1322,6 +1319,7 @@ static const struct file_operations lcd_proc_fops = {
>  	.write		= lcd_proc_write,
>  };
>  
> +/* Video-Out */
>  static int get_video_status(struct toshiba_acpi_dev *dev, u32 *status)
>  {
>  	u32 hci_result;
> @@ -1411,7 +1409,8 @@ static ssize_t video_proc_write(struct file *file, const char __user *buf,
>  			_set_bit(&new_video_out, HCI_VIDEO_OUT_TV, tv_out);
>  		/*
>  		 * To avoid unnecessary video disruption, only write the new
> -		 * video setting if something changed. */
> +		 * video setting if something changed.
> +		 */
>  		if (new_video_out != video_out)
>  			ret = write_acpi_int(METHOD_VIDEO_OUT, new_video_out);
>  	}
> @@ -1428,6 +1427,7 @@ static const struct file_operations video_proc_fops = {
>  	.write		= video_proc_write,
>  };
>  
> +/* Fan status */
>  static int get_fan_status(struct toshiba_acpi_dev *dev, u32 *status)
>  {
>  	u32 hci_result;
> @@ -1583,7 +1583,6 @@ static const struct file_operations version_proc_fops = {
>  /*
>   * Proc and module init
>   */
> -
>  #define PROC_TOSHIBA		"toshiba"
>  
>  static void create_toshiba_proc_entries(struct toshiba_acpi_dev *dev)
> @@ -2324,9 +2323,7 @@ static void toshiba_acpi_hotkey_work(struct work_struct *work)
>  		pr_err("ACPI NTFY method execution failed\n");
>  }
>  
> -/*
> - * Returns hotkey scancode, or < 0 on failure.
> - */
> +/* Returns hotkey scancode, or < 0 on failure */
>  static int toshiba_acpi_query_hotkey(struct toshiba_acpi_dev *dev)
>  {
>  	unsigned long long value;
> @@ -2488,6 +2485,9 @@ static int toshiba_acpi_setup_keyboard(struct toshiba_acpi_dev *dev)
>  	return error;
>  }
>  
> +/*
> + * Backlight
> + */
>  static int toshiba_acpi_setup_backlight(struct toshiba_acpi_dev *dev)
>  {
>  	struct backlight_properties props;
> @@ -2552,6 +2552,9 @@ static int toshiba_acpi_setup_backlight(struct toshiba_acpi_dev *dev)
>  	return 0;
>  }
>  
> +/*
> + * ACPI driver functions
> + */
>  static int toshiba_acpi_remove(struct acpi_device *acpi_dev)
>  {
>  	struct toshiba_acpi_dev *dev = acpi_driver_data(acpi_dev);
> -- 
> 2.3.6
> 
> 

-- 
Darren Hart
Intel Open Source Technology Center
