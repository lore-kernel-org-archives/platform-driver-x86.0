From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] platform/x86: ideapad-laptop: Add sysfs interface for
 touchpad state
Date: Thu, 16 Feb 2017 19:33:01 -0800
Message-ID: <20170217033301.GI6814@wisp>
References: <20170214141612.16913-1-rrs@debian.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170214141612.16913-1-rrs@debian.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Ritesh Raj Sarraf <rrs@debian.org>, Rafael Wysocki <rjw@rjwysocki.net>, Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, Ike Panhc <ike.pan@canonical.com>, Andy Shevchenko <andy@infradead.org>, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Tue, Feb 14, 2017 at 07:46:12PM +0530, Ritesh Raj Sarraf wrote:
> Lenovo Yoga (many variants: Yoga, Yoga2 Pro, Yoga2 13, Yoga3 Pro, Yoga 3
> 14 etc) has multiple modles that are a hybrid laptop, working in laptop
> mode as well as tablet mode.
> 
> Currently, there is no easy interface to determine the touchpad status,
> which in case of the Yoga family of machines, can also be useful to
> assume tablet mode status.
> Note: The ideapad-laptop driver does not provide a SW_TABLET_MODE either
> 
> For a detailed discussion  on why we want either of the interfaces,
> please see:
> https://bugs.launchpad.net/onboard/+bug/1366421/comments/43

Thanks for your work on this Ritesh.

I object to this statement on principle:

    "I believe only a single source will be strictly necessary, but the more the
     better, because some will work better than others."

More interfaces are most definitely *not* better :-) Ideally we would have a
single method for convertibles to indicate their state to userspace for it to
take action based on user(space)-defined policy.

Obviously we don't want GNOME, KDE, XFCE, X, Wayland, DBUS, etc. etc. all having
to check different sys files for every known laptop all using different names,
formats, and values.

That said, we need to make these systems usable, and as there appears not to be
an accepted standard way of doing this, I don't object to the approach. However,
you mentioned in the bug comments (#64) on 2/12:

    "I have attached the final patch that I had proposed, but for whatever
    reasons, the maintainer isn't convinced that that interface is needed."

This is the only version of this patch I have seen. Who objected to the patch?

I would like to hear from Rafael and Dmitry, for their opinion on an ACPI or INPUT
interface for indicating TABLET_MODE to userspace. Even if we accept this patch
as is, we should be thinking about how to do this in a standard way.

> 
> This patch adds a sysfs interface for read/write access under:
> /sys/bus/platform/devices/VPC2004\:00/touchpad_mode
> 
> Signed-off-by: Ritesh Raj Sarraf <rrs@debian.org>
> ---
>  .../ABI/testing/sysfs-platform-ideapad-laptop      |  9 ++++++
>  drivers/platform/x86/ideapad-laptop.c              | 33 ++++++++++++++++++++++
>  2 files changed, 42 insertions(+)
> 
> diff --git a/Documentation/ABI/testing/sysfs-platform-ideapad-laptop b/Documentation/ABI/testing/sysfs-platform-ideapad-laptop
> index b31e782bd985..401e37e5acbd 100644
> --- a/Documentation/ABI/testing/sysfs-platform-ideapad-laptop
> +++ b/Documentation/ABI/testing/sysfs-platform-ideapad-laptop
> @@ -17,3 +17,12 @@ Description:
>  			* 2 -> Dust Cleaning
>  			* 4 -> Efficient Thermal Dissipation Mode
>  
> +What:		/sys/devices/platform/ideapad/touchpad_mode
> +Date:		Jan 2017
> +KernelVersion:	4.11
> +Contact:	"Ritesh Raj Sarraf <rrs@debian.org>"
> +Description:
> +		Control touchpad mode.
> +                        * 1 -> Switched On
> +                        * 0 -> Switched Off

Please use consistent whitespace for indentation, in this case, use tabs for the
above two lines.

> +
> diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/ideapad-laptop.c
> index f46ece2ce3c4..639af45b45b6 100644
> --- a/drivers/platform/x86/ideapad-laptop.c
> +++ b/drivers/platform/x86/ideapad-laptop.c
> @@ -423,9 +423,42 @@ static ssize_t store_ideapad_fan(struct device *dev,
>  
>  static DEVICE_ATTR(fan_mode, 0644, show_ideapad_fan, store_ideapad_fan);
>  
> +
> +static ssize_t show_touchpad_mode(struct device *dev,
> +				struct device_attribute *attr,
> +				char *buf)
> +{
> +	unsigned long result;
> +	struct ideapad_private *priv = dev_get_drvdata(dev);

For consistency of coding style, please list longest variable declarations
first, and proceed in decreasing line length. "Reverse Christmas Tree Order".

> +
> +	if (read_ec_data(priv->adev->handle, VPCCMD_R_TOUCHPAD, &result))
> +		return sprintf(buf, "-1\n");
> +	return sprintf(buf, "%lu\n", result);
> +}
> +
> +static ssize_t store_touchpad_mode(struct device *dev,
> +				 struct device_attribute *attr,
> +				 const char *buf, size_t count)
> +{
> +	int ret, state;
> +	struct ideapad_private *priv = dev_get_drvdata(dev);

Reverse christmas tree order

> +
> +	if (!count)
> +		return 0;
> +	if (sscanf(buf, "%i", &state) != 1)
> +		return -EINVAL;

Please use kstrtoint, and no need to check for count as this function won't get
called if it is 0.

> +	ret = write_ec_cmd(priv->adev->handle, VPCCMD_W_TOUCHPAD, state);
> +	if (ret < 0)
> +		return -EIO;
> +	return count;
> +}
> +
> +static DEVICE_ATTR(touchpad_mode, 0644, show_touchpad_mode, store_touchpad_mode);

Please use:

static DEVICE_ATTR_RW(touchpad_mode);

You'll need to move the show_ and store_ prefixes to be postfixes, see
toshiba-acpi.c for several examples.

> +
>  static struct attribute *ideapad_attributes[] = {
>  	&dev_attr_camera_power.attr,
>  	&dev_attr_fan_mode.attr,
> +	&dev_attr_touchpad_mode.attr,
>  	NULL
>  };
>  
> -- 
> 2.11.0
> 
> 

-- 
Darren Hart
Intel Open Source Technology Center
