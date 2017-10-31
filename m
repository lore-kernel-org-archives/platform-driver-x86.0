From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH v11 05/15] platform/x86: dell-wmi-descriptor: split WMI
 descriptor into it's own driver
Date: Tue, 31 Oct 2017 16:31:46 -0700
Message-ID: <20171031233146.GA5787@fury>
References: <cover.1508515469.git.mario.limonciello@dell.com>
 <a740a284f62e9fbbefe0f2567e20ccf997d43e25.1508515469.git.mario.limonciello@dell.com>
 <20171030114652.kopuffflshq2ates@pali>
 <27e2d166f2ce461fb025ebf06a284d01@ausx13mpc124.AMER.DELL.COM>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <27e2d166f2ce461fb025ebf06a284d01@ausx13mpc124.AMER.DELL.COM>
Sender: linux-kernel-owner@vger.kernel.org
To: Mario.Limonciello@dell.com
Cc: pali.rohar@gmail.com, andy.shevchenko@gmail.com, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, luto@kernel.org, quasisec@google.com, rjw@rjwysocki.net, mjg59@google.com, hch@lst.de, greg@kroah.com, gnomes@lxorguk.ukuu.org.uk
List-Id: platform-driver-x86.vger.kernel.org

On Mon, Oct 30, 2017 at 01:32:57PM +0000, Mario.Limonciello@dell.com wrote:
> 
> 
> > -----Original Message-----
> > From: Pali Rohár [mailto:pali.rohar@gmail.com]
> > Sent: Monday, October 30, 2017 6:47 AM
> > To: Limonciello, Mario <Mario_Limonciello@Dell.com>
> > Cc: dvhart@infradead.org; Andy Shevchenko <andy.shevchenko@gmail.com>;
> > LKML <linux-kernel@vger.kernel.org>; platform-driver-x86@vger.kernel.org; Andy
> > Lutomirski <luto@kernel.org>; quasisec@google.com; rjw@rjwysocki.net;
> > mjg59@google.com; hch@lst.de; Greg KH <greg@kroah.com>; Alan Cox
> > <gnomes@lxorguk.ukuu.org.uk>
> > Subject: Re: [PATCH v11 05/15] platform/x86: dell-wmi-descriptor: split WMI
> > descriptor into it's own driver
> > 
> > On Friday 20 October 2017 12:40:20 Mario Limonciello wrote:
> > > diff --git a/drivers/platform/x86/dell-wmi-descriptor.c
> > b/drivers/platform/x86/dell-wmi-descriptor.c
> > > new file mode 100644
> > > index 000000000000..3204c408e261
> > > --- /dev/null
> > > +++ b/drivers/platform/x86/dell-wmi-descriptor.c
> > 
> > This dell-wmi-descriptor.c looks good now!
> > 
> > > diff --git a/drivers/platform/x86/dell-wmi-descriptor.h
> > b/drivers/platform/x86/dell-wmi-descriptor.h
> > > new file mode 100644
> > > index 000000000000..5f7b69c2c83a
> > > --- /dev/null
> > > +++ b/drivers/platform/x86/dell-wmi-descriptor.h
> > > @@ -721,7 +652,9 @@ static int dell_wmi_events_set_enabled(bool enable)
> > >  static int dell_wmi_probe(struct wmi_device *wdev)
> > >  {
> > >  	struct dell_wmi_priv *priv;
> > > -	int err;
> > > +
> > > +	if (!wmi_has_guid(DELL_WMI_DESCRIPTOR_GUID))
> > > +		return -ENODEV;
> > >
> > >  	priv = devm_kzalloc(
> > >  		&wdev->dev, sizeof(struct dell_wmi_priv), GFP_KERNEL);
> > > @@ -729,9 +662,8 @@ static int dell_wmi_probe(struct wmi_device *wdev)
> > >  		return -ENOMEM;
> > >  	dev_set_drvdata(&wdev->dev, priv);
> > >
> > > -	err = dell_wmi_check_descriptor_buffer(wdev);
> > > -	if (err)
> > > -		return err;
> > > +	if (!dell_wmi_get_interface_version(&priv->interface_version))
> > > +		return -EPROBE_DEFER;
> > 
> > But here is still a problem. You added check that
> > DELL_WMI_DESCRIPTOR_GUID exists in APCI table, but it does not mean that
> > probe method of dell-wmi-descriptor cannot fail.
> > 
> > With PROBE_DEFER, dell_wmi_probe function would be called later again
> > and again, even when probing dell-wmi-descriptor failed and so dell-wmi
> > in this case cannot work.
> > 
> 
> Yes it's possible that probe method can fail, but it depends on the reason for
> failure if it will fail again later.  For example if not enough memory, it may work
> later.  Or maybe user manually unbound from GUID, should continue to try until
> it's bound again.
> 
> So in short, I believe this is the correct behavior to adopt.

In this case, I believe the synchronous request_module("dell-wmi-descriptor")
would provide the desired result. The exit status doesn't even need to be
checked. If that is successful, and the interface_version still returns false,
then it can be considered an error and we can exit. If it fails, the
interface_version will return false, and it is also an error.

This can be easily added as a single patch on top of this series:

diff --git a/drivers/platform/x86/dell-wmi.c b/drivers/platform/x86/dell-wmi.c
index dcfa5de..964ca54 100644
--- a/drivers/platform/x86/dell-wmi.c
+++ b/drivers/platform/x86/dell-wmi.c
@@ -665,8 +665,9 @@ static int dell_wmi_probe(struct wmi_device *wdev)
 		return -ENOMEM;
 	dev_set_drvdata(&wdev->dev, priv);
 
+	request_module("dell-wmi-descriptor");
 	if (!dell_wmi_get_interface_version(&priv->interface_version))
-		return -EPROBE_DEFER;
+		return -ENODEV;
 
 	return dell_wmi_input_setup(wdev);
 }

Pali, I believe this addresses your concern?

-- 
Darren Hart
VMware Open Source Technology Center
