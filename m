From: Joe Perches <joe@perches.com>
Subject: Re: [PATCH v3 07/10] intel_mid: Added custom device_handler support
Date: Mon, 14 Oct 2013 09:16:55 -0700
Message-ID: <1381767415.25528.10.camel@joe-AO722>
References: <1381549404-22594-1-git-send-email-david.a.cohen@linux.intel.com>
	 <1381549404-22594-8-git-send-email-david.a.cohen@linux.intel.com>
	 <525C15E8.9010201@zytor.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <525C15E8.9010201@zytor.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: David Cohen <david.a.cohen@linux.intel.com>, tglx@linutronix.de, Ingo Molnar <mingo@kernel.org>, linux-kernel@vger.kernel.org, x86@kernel.org, platform-driver-x86@vger.kernel.org, Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
List-Id: platform-driver-x86.vger.kernel.org

On Mon, 2013-10-14 at 09:03 -0700, H. Peter Anvin wrote:
> On 10/11/2013 08:43 PM, David Cohen wrote:
> >  
> >  	/* MSIC subdevices */
> > -	{"msic_battery", SFI_DEV_TYPE_IPC, 1, &msic_battery_platform_data},
> > -	{"msic_gpio", SFI_DEV_TYPE_IPC, 1, &msic_gpio_platform_data},
> > -	{"msic_audio", SFI_DEV_TYPE_IPC, 1, &msic_audio_platform_data},
> > -	{"msic_power_btn", SFI_DEV_TYPE_IPC, 1, &msic_power_btn_platform_data},
> > -	{"msic_ocd", SFI_DEV_TYPE_IPC, 1, &msic_ocd_platform_data},
> > -	{"msic_thermal", SFI_DEV_TYPE_IPC, 1, &msic_thermal_platform_data},
> > -
> > +	{"msic_battery", SFI_DEV_TYPE_IPC, 1, &msic_battery_platform_data,
> > +					NULL},
> > +	{"msic_gpio", SFI_DEV_TYPE_IPC, 1, &msic_gpio_platform_data, NULL},
> > +	{"msic_audio", SFI_DEV_TYPE_IPC, 1, &msic_audio_platform_data, NULL},
> > +	{"msic_power_btn", SFI_DEV_TYPE_IPC, 1, &msic_power_btn_platform_data,
> > +					NULL},
> > +	{"msic_ocd", SFI_DEV_TYPE_IPC, 1, &msic_ocd_platform_data, NULL},
> > +	{"msic_thermal", SFI_DEV_TYPE_IPC, 1, &msic_thermal_platform_data,
> > +					NULL},
> >  	{},
> >  };
> >  
> 
> For highly regular arrays like this it is better to keep each line a
> single line even if it gets a bit too long rather than randomly breaking
> them.  The alternative is to put every field of every entry on a
> separate line, but I don't think that is necessary called for here.

True.

Another option is to #define YA macro to produce the
SFI_DEV_TYPE_IPC, 1, ... NULL that's common to all of them.
