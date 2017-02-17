From: Ritesh Raj Sarraf <rrs@debian.org>
Subject: Re: [PATCH] platform/x86: ideapad-laptop: Add sysfs interface for
 touchpad state
Date: Fri, 17 Feb 2017 14:49:00 +0530
Message-ID: <1487323140.6980.20.camel@debian.org>
References: <20170214141612.16913-1-rrs@debian.org>
         <20170217033301.GI6814@wisp>
         <CAHp75VeUGMYpmth34OisQT54VhmkuDSFp=OAOu+c69L3GUZUmg@mail.gmail.com>
         <20170217084806.GA4397@dtor-ws>
Reply-To: rrs@debian.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170217084806.GA4397@dtor-ws>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Darren Hart <dvhart@infradead.org>, Rafael Wysocki <rjw@rjwysocki.net>, Platform Driver <platform-driver-x86@vger.kernel.org>, Ike Panhc <ike.pan@canonical.com>, Andy Shevchenko <andy@infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA512

Hello Dmitry,

On Fri, 2017-02-17 at 00:48 -0800, Dmitry Torokhov wrote:
> It looks like the patch is trying to provide a way to disable the
> touchpad when transitioning in tablet mode. 

The keyboard/touchpad get disabled, by hardware, when flipped to tablet mode.
Since currently, the driver has no way to expose a tablet-mode interface, we
relied on this behavior, for the Lenovo Yoga device types.

> In ChromeOS we have a notion
> of "inhibiting" input devices, where userspace policy daemon tells the
> kernel that it is not interested in events from a given device and input
> core will suppress events from such device (and driver may optionally
> put device into low power mode, if it chooses to do so). But in this
> case the control seems to be totally outside of the input driver (which
> I suspect is PS/2 device), so the policy daemon would have to have
> specific knowledge of this new knob.
> 
> BTW, I am not sure if this is actually reliable: if system goes to S3
> with lid open and user changes it into tablet form, nobody will tell the
> EC that touchpad should be ignored and it will wake up the tablet.

I am not sure what you mean here. But:

root@learner:/sys/bus/platform/devices/VPC2004:00# When in normal mode^C
root@learner:/sys/bus/platform/devices/VPC2004:00# cat touchpad_mode 
1

S3 Suspend here. THen flip hw to tablet mode. Now, hit power btn to Resume.

root@learner:/sys/bus/platform/devices/VPC2004:00# Now in tablet mode^C
root@learner:/sys/bus/platform/devices/VPC2004:00# cat touchpad_mode 
0

- -- 
Ritesh Raj Sarraf | http://people.debian.org/~rrs
Debian - The Universal Operating System
-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEQCVDstmIVAB/Yn02pjpYo/LhdWkFAlimwAQACgkQpjpYo/Lh
dWkzIw/+NMiQ4A/OplUP/g6mTfba5zyuN0g9Or6RwzXyPrFsWbPAN4E6pcNIM1OT
oy8RAnrqdSQymVH5atbR/ysPwlzG19+LWB4FVlVdkDMKkVonAHmUX+mL9+KFa7E5
+RmpS9Hzc6cLv1kpKMUeLD7j9U3I4NkUEsxDZwLk916KE6fCthGsmbn1gGADv3oT
/lErDW7MLaImR67cmHmRhfhIotQPokcn3OVT/Eb7K8UjvXQLlWnDxMdxlQ7xDTua
aJ3c/lB+FQytwp/JBSbNpzspNcCX5mmkh6PERXhxLJzL1CpCz3qnwKwKyeoGFcjv
goj+CTZNsnGqaBuZThNI2vVWJRHqGCX2qp3IyWrSzNa6j5SfMTlgr0a/WsI7rpiY
4+81OXoeCVcr+ZGO4wtsvR1WDWvXqb+0bWYByNu85L/Rj9KWzxfh1mbtahG6odi8
bp7/+1cy55+d4XnX2/QHgkXdSCelBPtwH+aJUBp5av1N6t88+Dat8p3EyK30Cyp/
XfdglsfKWvmJX+hLBgR75ejy3cvr5iBIuExuULZNd8qrj+4dYDt4cYQB/MnttLt4
HZ1c/qSjMTDPdMBb4s3C844Pgk6QsKHJwLEl2zTN8HqNTMdwHBktyFPEzsRqV6Wn
Kea6z4lFUwS17LCaq/bhCwvYcFJm2XSimtXWj1a50YdwEgAiT5o=
=nuhe
-----END PGP SIGNATURE-----
