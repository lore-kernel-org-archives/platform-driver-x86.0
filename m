From: Jonathan Woithe <jwoithe@just42.net>
Subject: Re: [PATCH] platform/x86: fujitsu-laptop: Don't oops when FUJ02E3 is
 not presnt
Date: Sat, 23 Sep 2017 18:38:40 +0930
Message-ID: <20170923090839.GC21630@marvin.atrad.com.au>
References: <20170918200059.16279-1-ville.syrjala@linux.intel.com>
 <20170923000048.GC20327@fury>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from server.atrad.com.au ([150.101.241.2]:49064 "EHLO
        server.atrad.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751149AbdIWJJX (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 23 Sep 2017 05:09:23 -0400
Content-Disposition: inline
In-Reply-To: <20170923000048.GC20327@fury>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: Ville Syrjala <ville.syrjala@linux.intel.com>, platform-driver-x86@vger.kernel.org, Andy Shevchenko <andy@infradead.org>

Hi Darren

The more detailed follow-up, as promised. :-)  Sorry for the delay.

On Fri, Sep 22, 2017 at 05:00:48PM -0700, Darren Hart wrote:
> On Mon, Sep 18, 2017 at 11:00:59PM +0300, Ville Syrjala wrote:
> > From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > 
> > My Fujitsu-Siemens Lifebook S6120 doesn't have the FUJ02E3 device,
> > but it does have FUJ02B1. That means we do register the backlight
> > device (and it even seems to work), but the code will oops as soon
> > as we try to set the backlight brightness because it's trying to
> 
> I'm curious by what you mean with "it even seems to work". Since it
> crashes when adjusting, what does it do that "works" ?

As mentioned earlier, I have assumed that this means the backlight
adjustment works correctly if the suggested patch has been applied.  Having
thought about this some more I am unconvinced: if fext is NULL then
call_fext_func() (with the check added) can't have any effect.  The
backlight adjustment might still work, but it's not due to this code path.

> > call call_fext_func() with a NULL device. Let's just skip those
> > function calls when the FUJ02E3 device is not present.
> 
> Interesting. We call call_fext_func from many locations using the
> "device" argument, or the driver static "fext".
> 
> This looks to me that we should be a bit more consistent here.

Tidying this up further is the aim of Michal's ongoing cleanup work which
was to lead in to the splitting of the driver into two separate modules (one
for each ACPI device).  However, this plan was predicated on the idea that
all fujitsu laptops would have the FUJ02E3 device while some also included
the FUJ02B1 backlight device.  Ville's report about the S6120 demonstrates
that this assumption is wrong, so the approach for splitting the driver
needs to be revisited (and may turn out to be much trickier than first
thought).  Michal has indicated that he is giving it consideration.

> Finally, it seems a proper fix would be to either not register the
> backlight device if !fext or to check for !fext inside call_fext_func.

According to my initial understanding of Ville's report, it suggests that
his S6120 needs the FUJ02B1 backlight device registered even though there's
no FUJ02E3 (fext) in his system.  This means that not registering the
backlight device in the absence of FUJ02E3 is no good: the S6120 needs the
backlight device anyway.  However, this understanding might be wrong, which
means enforcing the requirement that FUJ02E3 exists before FUJ02B1 might be
an option.  Of course we have no way of knowing whether this might trip up
some other variation of the hardware.

Checking inside call_fext_func was the alternative approach that Michal
suggested.  Either would work and I would be happy for either.  Due to the
ongoing restructuring work that Michal's doing I thought that keeping the
test local to the only current user of fext might make things easier, but I
certainly have no firm preference either way.  Since the proposed patch is
known to work I figured we could run with that for the moment in order to
address what is effectively a regression.  The "proper fix" (whatever form
that ends up taking) could then just be a part of Michel's future clean-up
patch series.  However, if you feel that going straight for a
call_fext_func() fix is better then we could do that:

--- a/drivers/platform/x86/fujitsu-laptop.c	2017-09-23 18:24:47.258058706 +0930
+++ b/drivers/platform/x86/fujitsu-laptop.c	2017-09-23 18:27:24.938052251 +0930
@@ -153,6 +153,10 @@ static int call_fext_func(struct acpi_de
 	unsigned long long value;
 	acpi_status status;
 
+	if (!device) {
+		return 0;
+	}
+
 	status = acpi_evaluate_integer(device->handle, "FUNC", &arg_list,
 				       &value);
 	if (ACPI_FAILURE(status)) {

Signed-off-by: Jonathan Woithe <jwoithe@just42.net>

As Michal suggested, this approach does have the advantage of protecting
against other unforeseen hardware arrangements in the future and therefore
might be the better solution.

Given the proven unpredictable nature of the hardware arrangements in this
laptop series I would be more comfortable at this stage with one of the two
proposed NULL device checks: either the one Ville suggested or the test in
call_fext_func().  Making assumptions about precisely which devices might be
present (which is what the "FUJ02E3 exists" test would do) is is what
tripped us up in this case.

Regards
  jonathan
