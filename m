From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH 1/3] platform/dell-wmi: Fix driver interface version query
Date: Tue, 1 Aug 2017 13:59:56 -0700
Message-ID: <20170801205956.GE3110@fury>
References: <cover.1501601667.git.luto@kernel.org>
 <0cc9b015ed366f3fd104d2de707083c6ca2c2a5a.1501601667.git.luto@kernel.org>
 <20170801154312.GA25574@pali>
 <CALCETrUHw-bDMo6mrNM8+tdNDn71-ycb-aDtFTv82B0s8FiKHA@mail.gmail.com>
 <20170801204546.GI25574@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([65.50.211.133]:57677 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752689AbdHAU76 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 1 Aug 2017 16:59:58 -0400
Content-Disposition: inline
In-Reply-To: <20170801204546.GI25574@pali>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>
Cc: Andy Lutomirski <luto@kernel.org>, platform-driver-x86@vger.kernel.org

On Tue, Aug 01, 2017 at 10:45:46PM +0200, Pali Rohár wrote:
> On Tuesday 01 August 2017 11:08:26 Andy Lutomirski wrote:
> > On Tue, Aug 1, 2017 at 8:43 AM, Pali Rohár <pali.rohar@gmail.com> wrote:
> > > On Tuesday 01 August 2017 08:37:26 Andy Lutomirski wrote:
> > >> When I converted dell-wmi to the new bus infrastructure, I left the
> > >> call to dell_wmi_check_descriptor_buffer() in dell_wmi_init().  This
> > >> could cause two problems:
> > >>
> > >>  - An error message when loading the driver on a system without
> > >>    dell-wmi.  We'd try to read the event descriptor even if the WMI
> > >>    GUID wasn't there.
> > >>
> > >>  - A possible race if dell-wmi was loaded manually before wmi was
> > >>    fully initialized.
> > >>
> > >> Fix it by moving the call to the probe function where it belongs.
> > >>
> > >> Fixes: bff589be59c5 ("platform/x86: dell-wmi: Convert to the WMI bus infrastructure")
> > >> Signed-off-by: Andy Lutomirski <luto@kernel.org>
> > >> ---
> > >>  drivers/platform/x86/dell-wmi.c | 12 +++++++-----
> > >>  1 file changed, 7 insertions(+), 5 deletions(-)
> > >>
> > >> diff --git a/drivers/platform/x86/dell-wmi.c b/drivers/platform/x86/dell-wmi.c
> > >> index f8978464df31..dad8f4afa17c 100644
> > >> --- a/drivers/platform/x86/dell-wmi.c
> > >> +++ b/drivers/platform/x86/dell-wmi.c
> > >> @@ -626,7 +626,7 @@ static void dell_wmi_input_destroy(struct wmi_device *wdev)
> > >>   * WMI Interface Version     8       4    <version>
> > >>   * WMI buffer length        12       4    4096
> > >>   */
> > >> -static int __init dell_wmi_check_descriptor_buffer(void)
> > >> +static int dell_wmi_check_descriptor_buffer(void)
> > >>  {
> > >>       struct acpi_buffer out = { ACPI_ALLOCATE_BUFFER, NULL };
> > >>       union acpi_object *obj;
> > >> @@ -717,9 +717,15 @@ static int dell_wmi_events_set_enabled(bool enable)
> > >>
> > >>  static int dell_wmi_probe(struct wmi_device *wdev)
> > >>  {
> > >> +     int err;
> > >> +
> > >>       struct dell_wmi_priv *priv = devm_kzalloc(
> > >>               &wdev->dev, sizeof(struct dell_wmi_priv), GFP_KERNEL);
> > >>
> > >> +     err = dell_wmi_check_descriptor_buffer();
> > >> +     if (err)
> > >> +             return err;
> > >> +
> > >>       dev_set_drvdata(&wdev->dev, priv);
> > >>
> > >>       return dell_wmi_input_setup(wdev);
> > >> @@ -749,10 +755,6 @@ static int __init dell_wmi_init(void)
> > >>  {
> > >>       int err;
> > >>
> > >> -     err = dell_wmi_check_descriptor_buffer();
> > >> -     if (err)
> > >> -             return err;
> > >> -
> > >>       dmi_check_system(dell_wmi_smbios_list);
> > >>
> > >>       if (wmi_requires_smbios_request) {
> > >
> > > Hi! You should move also dell_wmi_events_set_enabled() into
> > > dell_wmi_probe() as there is no need to enable receiving events prior to
> > > creating input device.
> > 
> > I thought of that and intentionally didn't do it: I wanted to leave
> > enable and the disable paired properly, and there's nothing that
> > tracks the enabled state per device.  Also, it's at least
> > theoretically possible to have more than one instance of dell-wmi in a
> > system (my laptop already has *two* wmi busses), and moving this code
> > to ->probe would break this.
> > 
> > (The current wmi.c code can't handle the same GUID on two busses, but
> > it could easily be added if anyone ever finds a laptop that does
> > that.)
> 
> Yes, thanks for clarification, it makes sense.
> 
> Just one hypothetical situation, but as we know we should not trust what
> vendors put into ACPI DSDT...
> 
> Before whole wmi bus patches were introduced, function
> dell_wmi_events_set_enabled() was called only after every check passed:
> 
> 1) WMI GUID exists
> 
> 2) WMI descriptor buffer has correct type
> 
> 3) machine is on DMI whitelist
> 
> Now after all those patches, only the last (3) check need to pass to
> call that dell_wmi_events_set_enabled() function which issue SMM call.
> 
> Do not know how big this issue is, I just want to point to this
> hypothetical problem that SMM call could be issued also in more cases.


Thanks for raising the point. In my opinion, it seems reasonable to expect that
#1 and #2 are implicit in #3 being coded up. We don't like to rely on hard coded
assumptions of course. What is the failure mode if #1 or #2 aren't satisfied?

> 
> -- 
> Pali Rohár
> pali.rohar@gmail.com
> 

-- 
Darren Hart
VMware Open Source Technology Center
