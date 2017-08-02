From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH 1/3] platform/dell-wmi: Fix driver interface version query
Date: Tue, 1 Aug 2017 19:54:14 -0700
Message-ID: <20170802025414.GB21551@fury>
References: <cover.1501601667.git.luto@kernel.org>
 <0cc9b015ed366f3fd104d2de707083c6ca2c2a5a.1501601667.git.luto@kernel.org>
 <20170801154312.GA25574@pali>
 <CALCETrUHw-bDMo6mrNM8+tdNDn71-ycb-aDtFTv82B0s8FiKHA@mail.gmail.com>
 <20170801204546.GI25574@pali>
 <20170801205956.GE3110@fury>
 <20170801211624.GJ25574@pali>
 <CALCETrVTsHmTXR+wQ5QC3Btv-AtJYpanqL3fvmFXqscpsCmCCA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([65.50.211.133]:48382 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751815AbdHBCyQ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 1 Aug 2017 22:54:16 -0400
Content-Disposition: inline
In-Reply-To: <CALCETrVTsHmTXR+wQ5QC3Btv-AtJYpanqL3fvmFXqscpsCmCCA@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Andy Lutomirski <luto@kernel.org>
Cc: Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>, platform-driver-x86@vger.kernel.org

On Tue, Aug 01, 2017 at 07:25:53PM -0700, Andy Lutomirski wrote:
> On Tue, Aug 1, 2017 at 2:16 PM, Pali Rohár <pali.rohar@gmail.com> wrote:
> > On Tuesday 01 August 2017 13:59:56 Darren Hart wrote:
> >> On Tue, Aug 01, 2017 at 10:45:46PM +0200, Pali Rohár wrote:
> >> > On Tuesday 01 August 2017 11:08:26 Andy Lutomirski wrote:
> >> > > On Tue, Aug 1, 2017 at 8:43 AM, Pali Rohár <pali.rohar@gmail.com> wrote:
> >> > > > On Tuesday 01 August 2017 08:37:26 Andy Lutomirski wrote:
...
> >> > > > Hi! You should move also dell_wmi_events_set_enabled() into
> >> > > > dell_wmi_probe() as there is no need to enable receiving events prior to
> >> > > > creating input device.
> >> > >
> >> > > I thought of that and intentionally didn't do it: I wanted to leave
> >> > > enable and the disable paired properly, and there's nothing that
> >> > > tracks the enabled state per device.  Also, it's at least
> >> > > theoretically possible to have more than one instance of dell-wmi in a
> >> > > system (my laptop already has *two* wmi busses), and moving this code
> >> > > to ->probe would break this.
> >> > >
> >> > > (The current wmi.c code can't handle the same GUID on two busses, but
> >> > > it could easily be added if anyone ever finds a laptop that does
> >> > > that.)
> >> >
> >> > Yes, thanks for clarification, it makes sense.
> >> >
> >> > Just one hypothetical situation, but as we know we should not trust what
> >> > vendors put into ACPI DSDT...
> >> >
> >> > Before whole wmi bus patches were introduced, function
> >> > dell_wmi_events_set_enabled() was called only after every check passed:
> >> >
> >> > 1) WMI GUID exists
> >> >
> >> > 2) WMI descriptor buffer has correct type
> >> >
> >> > 3) machine is on DMI whitelist
> >> >
> >> > Now after all those patches, only the last (3) check need to pass to
> >> > call that dell_wmi_events_set_enabled() function which issue SMM call.
> >> >
> >> > Do not know how big this issue is, I just want to point to this
> >> > hypothetical problem that SMM call could be issued also in more cases.
> >>
> >>
> >> Thanks for raising the point. In my opinion, it seems reasonable to expect that
> >> #1 and #2 are implicit in #3 being coded up. We don't like to rely on hard coded
> >> assumptions of course. What is the failure mode if #1 or #2 aren't satisfied?
> >
> > What would happen if we call dell_wmi_events_set_enabled() on
> > unsupported platform? E.g. on some Dell Latitudes it cause resetting
> > keyboard backlight settings to default values, e.g. turn keyboard
> > backlight on for every key press and turn keyboard backlight off after
> > 5s of inactivity.
> >
> > I do not know more.
> >
> > But yes, #3 should imply that #1 and #2 are truth too...
> 
> Hmm.  I could do a followup patch to move it into ->probe and refcount it.
> 

Probe does seem like the logical place for it. Could we track the enabled state
in the private data structure?

From your comment above, what about moving enable to probe breaks the
theoretical possibility of two dell-wmi devices?

-- 
Darren Hart
VMware Open Source Technology Center
