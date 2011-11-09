From: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Subject: Re: [PATCH] x86: Add amilo-rfkill driver for some Fujitsu-Siemens
 Amilo laptops
Date: Wed, 09 Nov 2011 09:30:58 +0100
Message-ID: <1320827458.3845.2.camel@jlt3.sipsolutions.net>
References: <1320817459.18929.50.camel@deadeye>
	 (sfid-20111109_064459_718264_1D22260D)
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1320817459.18929.50.camel@deadeye> (sfid-20111109_064459_718264_1D22260D)
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ben Hutchings <ben-/+tVBieCtBitmTQ+vhA3Yw@public.gmane.org>
Cc: Matthew Garrett <mjg-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-wireless <linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Martin =?UTF-8?Q?Ve=C4=8De=C5=99a?= <ja-nfDFWhP/j+Adnm+yROfE0A@public.gmane.org>, Alejandro Vidal Mata <alex14-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Javier Vidal Mata <javitu-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Tino Schmidt <mailtinoshomepage-hi6Y0CQ0nG0@public.gmane.org>, 631664-61a8vm9lEZVf4u+23C9RwQ@public.gmane.org
List-Id: platform-driver-x86.vger.kernel.org

On Wed, 2011-11-09 at 05:44 +0000, Ben Hutchings wrote:

> +static bool init_blocked = false;
> +
> +/* Initial state set by 'radio' parameter, as in the fsaa1655g driver */
> +module_param_named(radio, init_blocked, invbool, 0);

I wonder what you need this for -- it shouldn't be necessary and the way
rfkill_init_sw_state() works might cause unexpected behaviour. I
recommend leaving that out, if you do leave it out rfkill will set the
desired state of the device as soon as the device is registered.

johannes

--
To unsubscribe from this list: send the line "unsubscribe linux-wireless" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
