From: Ritesh Raj Sarraf <rrs@debian.org>
Subject: Re: [PATCH v4] platform/x86: ideapad-laptop: Add sysfs interface
 for touchpad state
Date: Wed, 22 Feb 2017 15:54:18 +0530
Message-ID: <1487759058.9334.7.camel@debian.org>
References: <20170217184756.15181-1-rrs@debian.org>
Reply-To: rrs@debian.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-pg0-f66.google.com ([74.125.83.66]:35397 "EHLO
        mail-pg0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932254AbdBVKYn (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 22 Feb 2017 05:24:43 -0500
Received: by mail-pg0-f66.google.com with SMTP id 1so1724684pgz.2
        for <platform-driver-x86@vger.kernel.org>; Wed, 22 Feb 2017 02:24:37 -0800 (PST)
In-Reply-To: <20170217184756.15181-1-rrs@debian.org>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org, Andy Shevchenko <andy.shevchenko@gmail.com>, Darren Hart <dvhart@infradead.org>
Cc: Ike Panhc <ike.pan@canonical.com>, linux-kernel@vger.kernel.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA512

Hello Darren / Andy,

Any further comment on this patch ? Will this be accepted ?
Please give a N/ACK.

Thanks,
Ritesh

On Sat, 2017-02-18 at 00:17 +0530, Ritesh Raj Sarraf wrote:
> Lenovo Yoga (many variants: Yoga, Yoga2 Pro, Yoga2 13, Yoga3 Pro, Yoga 3
> 14 etc) has multiple modles that are a hybrid laptop, working in laptop
> mode as well as tablet mode.
> 
> Currently, there is no easy interface to determine the touchpad status,
> which in case of the Yoga family of machines, can also be useful to
> assume tablet mode status.
> Note: The ideapad-laptop driver does not provide a SW_TABLET_MODE either
> 
> For a detailed discussion  on why we want either of the interfaces,
> please see:
> https://bugs.launchpad.net/onboard/+bug/1366421/comments/43
> 
> This patch adds a sysfs interface for read/write access under:
> /sys/bus/platform/devices/VPC2004\:00/touchpad_mode
> 
> v4:
> Use kstrtobool because supported values are boolean
> 
> v3:
> Include Darren Hart's comments
> Changed sysfs inteface from "touchpad_mode" to "touchpad"
> 
> v2:
> Include Andy Shevchenko's comments
> 
> Signed-off-by: Ritesh Raj Sarraf <rrs@debian.org>
> ---
>  .../ABI/testing/sysfs-platform-ideapad-laptop      |  8 +++++
>  drivers/platform/x86/ideapad-laptop.c              | 34
> ++++++++++++++++++++++
>  2 files changed, 42 insertions(+)
> 
> diff --git a/Documentation/ABI/testing/sysfs-platform-ideapad-laptop
> b/Documentation/ABI/testing/sysfs-platform-ideapad-laptop
> index b31e782bd985..5d24f1e8e6ef 100644
> --- a/Documentation/ABI/testing/sysfs-platform-ideapad-laptop
> +++ b/Documentation/ABI/testing/sysfs-platform-ideapad-laptop
> @@ -17,3 +17,11 @@ Description:
>  			* 2 -> Dust Cleaning
>  			* 4 -> Efficient Thermal Dissipation Mode
>  
> +What:		/sys/devices/platform/ideapad/touchpad
> +Date:		Feb 2017
> +KernelVersion:	4.11
> +Contact:	"Ritesh Raj Sarraf <rrs@debian.org>"
> +Description:
> +		Control touchpad mode.
> +			* 1 -> Switched On
> +			* 0 -> Switched Off
> diff --git a/drivers/platform/x86/ideapad-laptop.c
> b/drivers/platform/x86/ideapad-laptop.c
> index f46ece2ce3c4..b35954707e11 100644
> --- a/drivers/platform/x86/ideapad-laptop.c
> +++ b/drivers/platform/x86/ideapad-laptop.c
> @@ -423,9 +423,43 @@ static ssize_t store_ideapad_fan(struct device *dev,
>  
>  static DEVICE_ATTR(fan_mode, 0644, show_ideapad_fan, store_ideapad_fan);
>  
> +
> +static ssize_t touchpad_show(struct device *dev,
> +				struct device_attribute *attr,
> +				char *buf)
> +{
> +	struct ideapad_private *priv = dev_get_drvdata(dev);
> +	unsigned long result;
> +
> +	if (read_ec_data(priv->adev->handle, VPCCMD_R_TOUCHPAD, &result))
> +		return sprintf(buf, "-1\n");
> +	return sprintf(buf, "%lu\n", result);
> +}
> +
> +static ssize_t touchpad_store(struct device *dev,
> +				 struct device_attribute *attr,
> +				 const char *buf, size_t count)
> +{
> +	struct ideapad_private *priv = dev_get_drvdata(dev);
> +	int ret;
> +	bool state;
> +
> +	ret = kstrtobool(buf, &state);
> +	if (ret)
> +		return ret;
> +
> +	ret = write_ec_cmd(priv->adev->handle, VPCCMD_W_TOUCHPAD, state);
> +	if (ret < 0)
> +		return -EIO;
> +	return count;
> +}
> +
> +static DEVICE_ATTR_RW(touchpad);
> +
>  static struct attribute *ideapad_attributes[] = {
>  	&dev_attr_camera_power.attr,
>  	&dev_attr_fan_mode.attr,
> +	&dev_attr_touchpad.attr,
>  	NULL
>  };
>  
- -- 
Ritesh Raj Sarraf | http://people.debian.org/~rrs
Debian - The Universal Operating System
-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEQCVDstmIVAB/Yn02pjpYo/LhdWkFAlitZtIACgkQpjpYo/Lh
dWnCsw/9Eo0+id6jjJZaVRBhtQTcI510T2IY/wDFfrMOH8Ei2+Iw1d/rCCA5iCWa
HDP9R+AZpFxM71nJsm/JZVuYOZDbKh17TkeM9eIG1dpQH48I576hz0IdwvRNeT+t
kba0NGyQTw0PdMdP8mcOhrFbDkFiLJ0rg0fu1ESxilTnshTUPch+1aUexqeBTCYG
ICvidlD0gr+Q8x9pbqCEdFNwRzqekl7a9ezR4bvyqXpJSx2DWVq2WFHbnrX9BADF
gextZaRWQ7sUR27seXO3JL0DgfYspDkP2UQno7lr4Vx3UxyeUUDVYmF2OmpupHJu
F8BifivXBPy0ZDLn8UbKgEMBqLIx5E3BWWdVyJyobkB9PHoDbe0vvpNXyAQW2xzY
X+CtozZ04su9rk5L+ivsozbAyNFXirHrXOOGZzTa/svKHSsR7xiFA9JHK5mwtnsl
KhJNR0FkXH+QIBm8dbUDteJ9/fTodnUjXN+C7dya9+Sb0Bi1AgSpVe1poZ+74XWR
jz5NtJ+yKxo7SOQ6SxRSPN7zLfhwpORoi5pid2Qn0dKpW8GoB8b6bi0xHGWuraIJ
LIVTJE6TgMgFkjPTJR4vlR+eoxyDM2HTsyx59fWwECEJUANXit7pnbixnZ4McYLh
he6dsgStv8kuHNNCJoeDPLiNYvruUKqHdnf/Vvbk0A+sCgY8JAI=
=BuNe
-----END PGP SIGNATURE-----
