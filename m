From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH 3/4] platform/x86: ideapad-laptop: use kstrto instead of
 sscanf and do clean up
Date: Fri, 8 Dec 2017 15:39:45 -0800
Message-ID: <20171208233945.GA14187@fury>
References: <20171202134534.3252-1-jiaxun.yang@flygoat.com>
 <20171202134534.3252-3-jiaxun.yang@flygoat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([65.50.211.133]:35814 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752662AbdLHXju (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 8 Dec 2017 18:39:50 -0500
Content-Disposition: inline
In-Reply-To: <20171202134534.3252-3-jiaxun.yang@flygoat.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: Ike Panhc <ike.pan@canonical.com>, Andy Shevchenko <andy@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Roger Jargoyhen <rjargoyhen@gmail.com>

On Sat, Dec 02, 2017 at 09:45:33PM +0800, Jiaxun Yang wrote:
> To deal with checkpatch warnings:
> WARNING: Prefer kstrto<type> to single variable sscanf
> 
> WARNING: Missing a blank line after declarations
> 
> WARNING: Block comments use a trailing */ on a separate line
> 
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
>  drivers/platform/x86/ideapad-laptop.c | 20 ++++++++++++++------
>  1 file changed, 14 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/ideapad-laptop.c
> index 1072b24370ac..924b07f7db06 100644
> --- a/drivers/platform/x86/ideapad-laptop.c
> +++ b/drivers/platform/x86/ideapad-laptop.c
> @@ -406,12 +406,14 @@ static ssize_t store_ideapad_cam(struct device *dev,
>  				 struct device_attribute *attr,
>  				 const char *buf, size_t count)
>  {
> -	int ret, state;
> +	int ret, state, rc;
>  	struct ideapad_private *priv = dev_get_drvdata(dev);
>  
> +	rc = kstrtoint(buf, 0, &state);
> +
>  	if (!count)
>  		return 0;

Better to keep the string to int here after the check for !count. No reason I
can see to move it above.

> -	if (sscanf(buf, "%i", &state) != 1)
> +	if (rc != 0)
>  		return -EINVAL;
>  	ret = write_ec_cmd(priv->adev->handle, VPCCMD_W_CAMERA, state);
>  	if (ret < 0)
> @@ -437,12 +439,14 @@ static ssize_t store_ideapad_fan(struct device *dev,
>  				 struct device_attribute *attr,
>  				 const char *buf, size_t count)
>  {
> -	int ret, state;
> +	int ret, state, rc;
>  	struct ideapad_private *priv = dev_get_drvdata(dev);
>  
> +	rc = kstrtoint(buf, 0, &state);
> +

Same here

>  	if (!count)
>  		return 0;
> -	if (sscanf(buf, "%i", &state) != 1)
> +	if (rc != 0)

And in both cases, kstrtoint can be used within the if condition, avoiding the
need for a new rc variable.

>  		return -EINVAL;
>  	if (state < 0 || state > 4 || state == 3)
>  		return -EINVAL;
> @@ -541,6 +545,7 @@ static umode_t ideapad_is_visible(struct kobject *kobj,
>  		supported = test_bit(CFG_CAMERA_BIT, &(priv->cfg));
>  	else if (attr == &dev_attr_fan_mode.attr) {
>  		unsigned long value;
> +
>  		supported = !read_ec_data(priv->adev->handle, VPCCMD_R_FAN,
>  					  &value);
>  	} else if (attr == &dev_attr_conservation_mode.attr) {
> @@ -880,11 +885,14 @@ static void ideapad_sync_touchpad_state(struct ideapad_private *priv)
>  
>  	/* Without reading from EC touchpad LED doesn't switch state */
>  	if (!read_ec_data(priv->adev->handle, VPCCMD_R_TOUCHPAD, &value)) {
> -		/* Some IdeaPads don't really turn off touchpad - they only
> +		/*
> +		 * Some IdeaPads don't really turn off touchpad - they only
>  		 * switch the LED state. We (de)activate KBC AUX port to turn
>  		 * touchpad off and on. We send KEY_TOUCHPAD_OFF and
> -		 * KEY_TOUCHPAD_ON to not to get out of sync with LED */
> +		 * KEY_TOUCHPAD_ON to not to get out of sync with LED
> +		 */
>  		unsigned char param;
> +
>  		i8042_command(&param, value ? I8042_CMD_AUX_ENABLE :
>  			      I8042_CMD_AUX_DISABLE);
>  		ideapad_input_report(priv, value ? 67 : 66);
> -- 
> 2.14.1
> 
> 

-- 
Darren Hart
VMware Open Source Technology Center
