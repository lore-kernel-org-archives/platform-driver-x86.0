From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH 1/3] toshiba_acpi: Cleanup variable declaration
Date: Sun, 28 Aug 2016 09:49:49 -0700
Message-ID: <20160828164949.GA96930@f23x64.localdomain>
References: <20160816180617.1743-1-coproscefalo@gmail.com>
 <20160816180617.1743-2-coproscefalo@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:45571 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755394AbcH1Qtu (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 28 Aug 2016 12:49:50 -0400
Content-Disposition: inline
In-Reply-To: <20160816180617.1743-2-coproscefalo@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Azael Avalos <coproscefalo@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, Aug 16, 2016 at 12:06:15PM -0600, Azael Avalos wrote:
> This patch moves all the multiple line variable declaration to a
> single line declaration (except variables being initialized)
> following the reverse tree order, to conform to the practices
> of the kernel.

Azael,

Apologies for the delay, I was trying to decide what position I wanted to take
on this as anything I do builds precedent for future patches.

Early on I was pretty strict about this for new code. I've found that there is
less consensus about this among the maintainers than I initially thought. I'm
not sure it's worth a patch just to clean this up - but I also don't object,
especially given how actively you maintain this driver.

One minor point about consolidating similar types in one declaration line. We
prefer to group similar types of related purpose. For example:

int in_len, out_len;
int num_frames;
int ret;

Rather than:

int in_len, out_len, num_frames, ret;

With that in mind, I'll take this as is, or I'll wait for a respin. Up to you.

--
Darren

> 
> Signed-off-by: Azael Avalos <coproscefalo@gmail.com>
> ---
>  drivers/platform/x86/toshiba_acpi.c | 98 +++++++++++++------------------------
>  1 file changed, 33 insertions(+), 65 deletions(-)
> 
> diff --git a/drivers/platform/x86/toshiba_acpi.c b/drivers/platform/x86/toshiba_acpi.c
> index 9d60a40..c6fc5cc 100644
> --- a/drivers/platform/x86/toshiba_acpi.c
> +++ b/drivers/platform/x86/toshiba_acpi.c
> @@ -321,10 +321,9 @@ static int write_acpi_int(const char *methodName, int val)
>  static acpi_status tci_raw(struct toshiba_acpi_dev *dev,
>  			   const u32 in[TCI_WORDS], u32 out[TCI_WORDS])
>  {
> +	union acpi_object in_objs[TCI_WORDS], out_objs[TCI_WORDS + 1];
>  	struct acpi_object_list params;
> -	union acpi_object in_objs[TCI_WORDS];
>  	struct acpi_buffer results;
> -	union acpi_object out_objs[TCI_WORDS + 1];
>  	acpi_status status;
>  	int i;
>  
> @@ -387,9 +386,8 @@ static int sci_open(struct toshiba_acpi_dev *dev)
>  {
>  	u32 in[TCI_WORDS] = { SCI_OPEN, 0, 0, 0, 0, 0 };
>  	u32 out[TCI_WORDS];
> -	acpi_status status;
> +	acpi_status status = tci_raw(dev, in, out);
>  
> -	status = tci_raw(dev, in, out);
>  	if  (ACPI_FAILURE(status)) {
>  		pr_err("ACPI call to open SCI failed\n");
>  		return 0;
> @@ -425,9 +423,8 @@ static void sci_close(struct toshiba_acpi_dev *dev)
>  {
>  	u32 in[TCI_WORDS] = { SCI_CLOSE, 0, 0, 0, 0, 0 };
>  	u32 out[TCI_WORDS];
> -	acpi_status status;
> +	acpi_status status = tci_raw(dev, in, out);
>  
> -	status = tci_raw(dev, in, out);
>  	if (ACPI_FAILURE(status)) {
>  		pr_err("ACPI call to close SCI failed\n");
>  		return;
> @@ -490,8 +487,7 @@ static void toshiba_illumination_set(struct led_classdev *cdev,
>  {
>  	struct toshiba_acpi_dev *dev = container_of(cdev,
>  			struct toshiba_acpi_dev, led_dev);
> -	u32 result;
> -	u32 state;
> +	u32 result, state;
>  
>  	/* First request : initialize communication. */
>  	if (!sci_open(dev))
> @@ -509,7 +505,7 @@ static enum led_brightness toshiba_illumination_get(struct led_classdev *cdev)
>  {
>  	struct toshiba_acpi_dev *dev = container_of(cdev,
>  			struct toshiba_acpi_dev, led_dev);
> -	u32 state, result;
> +	u32 result, state;
>  
>  	/* First request : initialize communication. */
>  	if (!sci_open(dev))
> @@ -604,8 +600,7 @@ static enum led_brightness toshiba_kbd_backlight_get(struct led_classdev *cdev)
>  {
>  	struct toshiba_acpi_dev *dev = container_of(cdev,
>  			struct toshiba_acpi_dev, kbd_led);
> -	u32 result;
> -	u32 state;
> +	u32 result, state;
>  
>  	/* Check the keyboard backlight state */
>  	result = hci_read(dev, HCI_KBD_ILLUMINATION, &state);
> @@ -624,8 +619,7 @@ static void toshiba_kbd_backlight_set(struct led_classdev *cdev,
>  {
>  	struct toshiba_acpi_dev *dev = container_of(cdev,
>  			struct toshiba_acpi_dev, kbd_led);
> -	u32 result;
> -	u32 state;
> +	u32 result, state;
>  
>  	/* Set the keyboard backlight state */
>  	state = brightness ? 1 : 0;
> @@ -672,9 +666,9 @@ static int toshiba_touchpad_get(struct toshiba_acpi_dev *dev, u32 *state)
>  /* Eco Mode support */
>  static void toshiba_eco_mode_available(struct toshiba_acpi_dev *dev)
>  {
> -	acpi_status status;
>  	u32 in[TCI_WORDS] = { HCI_GET, HCI_ECO_MODE, 0, 0, 0, 0 };
>  	u32 out[TCI_WORDS];
> +	acpi_status status;
>  
>  	dev->eco_supported = 0;
>  	dev->eco_led_registered = false;
> @@ -1282,9 +1276,8 @@ static struct proc_dir_entry *toshiba_proc_dir;
>  /* LCD Brightness */
>  static int __get_lcd_brightness(struct toshiba_acpi_dev *dev)
>  {
> -	u32 result;
> -	u32 value;
>  	int brightness = 0;
> +	u32 result, value;
>  
>  	if (dev->tr_backlight_supported) {
>  		int ret = get_tr_backlight_status(dev, &value);
> @@ -1317,8 +1310,7 @@ static int get_lcd_brightness(struct backlight_device *bd)
>  static int lcd_proc_show(struct seq_file *m, void *v)
>  {
>  	struct toshiba_acpi_dev *dev = m->private;
> -	int levels;
> -	int value;
> +	int levels, value;
>  
>  	if (!dev->backlight_dev)
>  		return -ENODEV;
> @@ -1375,16 +1367,16 @@ static ssize_t lcd_proc_write(struct file *file, const char __user *buf,
>  			      size_t count, loff_t *pos)
>  {
>  	struct toshiba_acpi_dev *dev = PDE_DATA(file_inode(file));
> +	int levels, value;
>  	char cmd[42];
>  	size_t len;
> -	int levels = dev->backlight_dev->props.max_brightness + 1;
> -	int value;
>  
>  	len = min(count, sizeof(cmd) - 1);
>  	if (copy_from_user(cmd, buf, len))
>  		return -EFAULT;
>  	cmd[len] = '\0';
>  
> +	levels = dev->backlight_dev->props.max_brightness + 1;
>  	if (sscanf(cmd, " brightness : %i", &value) != 1 &&
>  	    value < 0 && value > levels)
>  		return -EINVAL;
> @@ -1445,14 +1437,9 @@ static ssize_t video_proc_write(struct file *file, const char __user *buf,
>  				size_t count, loff_t *pos)
>  {
>  	struct toshiba_acpi_dev *dev = PDE_DATA(file_inode(file));
> -	char *buffer;
> -	char *cmd;
> +	int lcd_out, crt_out, tv_out, value, ret;
>  	int remain = count;
> -	int lcd_out = -1;
> -	int crt_out = -1;
> -	int tv_out = -1;
> -	int value;
> -	int ret;
> +	char *buffer, *cmd;
>  	u32 video_out;
>  
>  	cmd = kmalloc(count + 1, GFP_KERNEL);
> @@ -1486,6 +1473,7 @@ static ssize_t video_proc_write(struct file *file, const char __user *buf,
>  
>  	kfree(cmd);
>  
> +	lcd_out = crt_out = tv_out = -1;
>  	ret = get_video_status(dev, &video_out);
>  	if (!ret) {
>  		unsigned int new_video_out = video_out;
> @@ -1722,8 +1710,7 @@ static ssize_t fan_store(struct device *dev,
>  			 const char *buf, size_t count)
>  {
>  	struct toshiba_acpi_dev *toshiba = dev_get_drvdata(dev);
> -	int state;
> -	int ret;
> +	int state, ret;
>  
>  	ret = kstrtoint(buf, 0, &state);
>  	if (ret)
> @@ -1759,8 +1746,7 @@ static ssize_t kbd_backlight_mode_store(struct device *dev,
>  					const char *buf, size_t count)
>  {
>  	struct toshiba_acpi_dev *toshiba = dev_get_drvdata(dev);
> -	int mode;
> -	int ret;
> +	int mode, ret;
>  
>  
>  	ret = kstrtoint(buf, 0, &mode);
> @@ -1872,8 +1858,7 @@ static ssize_t kbd_backlight_timeout_store(struct device *dev,
>  					   const char *buf, size_t count)
>  {
>  	struct toshiba_acpi_dev *toshiba = dev_get_drvdata(dev);
> -	int time;
> -	int ret;
> +	int time, ret;
>  
>  	ret = kstrtoint(buf, 0, &time);
>  	if (ret)
> @@ -1929,8 +1914,7 @@ static ssize_t touchpad_store(struct device *dev,
>  			      const char *buf, size_t count)
>  {
>  	struct toshiba_acpi_dev *toshiba = dev_get_drvdata(dev);
> -	int state;
> -	int ret;
> +	int state, ret;
>  
>  	/* Set the TouchPad on/off, 0 - Disable | 1 - Enable */
>  	ret = kstrtoint(buf, 0, &state);
> @@ -1980,9 +1964,8 @@ static ssize_t usb_sleep_charge_store(struct device *dev,
>  				      const char *buf, size_t count)
>  {
>  	struct toshiba_acpi_dev *toshiba = dev_get_drvdata(dev);
> +	int state, ret;
>  	u32 mode;
> -	int state;
> -	int ret;
>  
>  	ret = kstrtoint(buf, 0, &state);
>  	if (ret)
> @@ -2021,11 +2004,8 @@ static ssize_t sleep_functions_on_battery_show(struct device *dev,
>  					       char *buf)
>  {
>  	struct toshiba_acpi_dev *toshiba = dev_get_drvdata(dev);
> +	int bat_lvl, status, ret, tmp;
>  	u32 state;
> -	int bat_lvl;
> -	int status;
> -	int ret;
> -	int tmp;
>  
>  	ret = toshiba_sleep_functions_status_get(toshiba, &state);
>  	if (ret < 0)
> @@ -2045,10 +2025,8 @@ static ssize_t sleep_functions_on_battery_store(struct device *dev,
>  						const char *buf, size_t count)
>  {
>  	struct toshiba_acpi_dev *toshiba = dev_get_drvdata(dev);
> +	int value, ret, tmp;
>  	u32 status;
> -	int value;
> -	int ret;
> -	int tmp;
>  
>  	ret = kstrtoint(buf, 0, &value);
>  	if (ret)
> @@ -2098,8 +2076,7 @@ static ssize_t usb_rapid_charge_store(struct device *dev,
>  				      const char *buf, size_t count)
>  {
>  	struct toshiba_acpi_dev *toshiba = dev_get_drvdata(dev);
> -	int state;
> -	int ret;
> +	int state, ret;
>  
>  	ret = kstrtoint(buf, 0, &state);
>  	if (ret)
> @@ -2134,8 +2111,7 @@ static ssize_t usb_sleep_music_store(struct device *dev,
>  				     const char *buf, size_t count)
>  {
>  	struct toshiba_acpi_dev *toshiba = dev_get_drvdata(dev);
> -	int state;
> -	int ret;
> +	int state, ret;
>  
>  	ret = kstrtoint(buf, 0, &state);
>  	if (ret)
> @@ -2155,8 +2131,7 @@ static ssize_t kbd_function_keys_show(struct device *dev,
>  				      struct device_attribute *attr, char *buf)
>  {
>  	struct toshiba_acpi_dev *toshiba = dev_get_drvdata(dev);
> -	int mode;
> -	int ret;
> +	int mode, ret;
>  
>  	ret = toshiba_function_keys_get(toshiba, &mode);
>  	if (ret < 0)
> @@ -2170,8 +2145,7 @@ static ssize_t kbd_function_keys_store(struct device *dev,
>  				       const char *buf, size_t count)
>  {
>  	struct toshiba_acpi_dev *toshiba = dev_get_drvdata(dev);
> -	int mode;
> -	int ret;
> +	int mode, ret;
>  
>  	ret = kstrtoint(buf, 0, &mode);
>  	if (ret)
> @@ -2213,8 +2187,7 @@ static ssize_t panel_power_on_store(struct device *dev,
>  				    const char *buf, size_t count)
>  {
>  	struct toshiba_acpi_dev *toshiba = dev_get_drvdata(dev);
> -	int state;
> -	int ret;
> +	int state, ret;
>  
>  	ret = kstrtoint(buf, 0, &state);
>  	if (ret)
> @@ -2251,8 +2224,7 @@ static ssize_t usb_three_store(struct device *dev,
>  			       const char *buf, size_t count)
>  {
>  	struct toshiba_acpi_dev *toshiba = dev_get_drvdata(dev);
> -	int state;
> -	int ret;
> +	int state, ret;
>  
>  	ret = kstrtoint(buf, 0, &state);
>  	if (ret)
> @@ -2279,8 +2251,7 @@ static ssize_t cooling_method_show(struct device *dev,
>  				   struct device_attribute *attr, char *buf)
>  {
>  	struct toshiba_acpi_dev *toshiba = dev_get_drvdata(dev);
> -	int state;
> -	int ret;
> +	int state, ret;
>  
>  	ret = toshiba_cooling_method_get(toshiba, &state);
>  	if (ret < 0)
> @@ -2294,8 +2265,7 @@ static ssize_t cooling_method_store(struct device *dev,
>  				    const char *buf, size_t count)
>  {
>  	struct toshiba_acpi_dev *toshiba = dev_get_drvdata(dev);
> -	int state;
> -	int ret;
> +	int state, ret;
>  
>  	ret = kstrtoint(buf, 0, &state);
>  	if (ret)
> @@ -2714,8 +2684,7 @@ static void toshiba_acpi_process_hotkeys(struct toshiba_acpi_dev *dev)
>  			dev->last_key_event = scancode;
>  		}
>  	} else if (dev->system_event_supported) {
> -		u32 result;
> -		u32 value;
> +		u32 result, value;
>  		int retries = 3;
>  
>  		do {
> @@ -2844,8 +2813,7 @@ static int toshiba_acpi_setup_keyboard(struct toshiba_acpi_dev *dev)
>  static int toshiba_acpi_setup_backlight(struct toshiba_acpi_dev *dev)
>  {
>  	struct backlight_properties props;
> -	int brightness;
> -	int ret;
> +	int brightness, ret;
>  
>  	/*
>  	 * Some machines don't support the backlight methods at all, and
> @@ -3015,8 +2983,8 @@ static int toshiba_acpi_add(struct acpi_device *acpi_dev)
>  {
>  	struct toshiba_acpi_dev *dev;
>  	const char *hci_method;
> -	u32 dummy;
>  	int ret = 0;
> +	u32 dummy;
>  
>  	if (toshiba_acpi)
>  		return -EBUSY;
> -- 
> 2.9.2
> 
> 

-- 
Darren Hart
Intel Open Source Technology Center
