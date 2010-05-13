From: "Joey Lee" <jlee@novell.com>
Subject: Re: [PATCH 4/4] msi-laptop: Add i8042 filter to sync sw state
	 with BIOS when function key pressed
Date: Thu, 13 May 2010 05:53:04 -0600
Message-ID: <4BEC74C002000023000190EE@novprvlin0050.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Content-Disposition: inline
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: dmitry.torokhov@gmail.com
Cc: mzxreary@0pointer.de, greg@kroah.com, rpurdie@linux.intel.com, mjg@redhat.com, gregkh@suse.de, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org

Hi Dmitry,=20

Thank's for your review.

=E6=96=BC =E5=9B=9B=EF=BC=8C2010-05-13 =E6=96=BC 00:52 -0700=EF=BC=8CDm=
itry Torokhov =E6=8F=90=E5=88=B0=EF=BC=9A
> On Wed, May 12, 2010 at 11:56:47AM -0700, Greg KH wrote:
> >  static int __init msi_init(void)
> > @@ -819,6 +875,7 @@ static void __exit msi_cleanup(void)
> >  	platform_driver_unregister(&msipf_driver);
> >  	backlight_device_unregister(msibl_device);
> > =20
> > +	i8042_remove_filter(msi_laptop_i8042_filter);
>=20
> You also need cancel_delayed_work_sync() here. Sorry for not noticing
> this before.
>=20

Yes, you are right, need add cancel_delayed_work_sync().

Joey Lee

--
To unsubscribe from this list: send the line "unsubscribe platform-driv=
er-x86" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
