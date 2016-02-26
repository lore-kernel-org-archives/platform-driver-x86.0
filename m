From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH v4 1/1] ideapad-laptop: Add ideapad Y700 (15) to the
 no_hw_rfkill DMI list
Date: Fri, 26 Feb 2016 10:56:22 -0800
Message-ID: <20160226185622.GA21870@dvhart-mobl5.amr.corp.intel.com>
References: <Pine.NEB.4.64.1602191918380.15324@faeroes.freeshell.org>
 <20160222221416.GD14101@dvhart-mobl5.amr.corp.intel.com>
 <Pine.NEB.4.64.1602221810140.9397@norge.freeshell.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:57481 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932751AbcBZS42 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 26 Feb 2016 13:56:28 -0500
Content-Disposition: inline
In-Reply-To: <Pine.NEB.4.64.1602221810140.9397@norge.freeshell.org>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: John Dahlstrom <jodarom@SDF.ORG>
Cc: Ike Panhc <ike.pan@canonical.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, Feb 22, 2016 at 10:29:48PM -0600, John Dahlstrom wrote:
> On Mon, 22 Feb 2016, Darren Hart wrote:
> 
> >Unfortunately, backporting this to stable is not quite so simple.
> >
> >First, 3.16 doesn't really work as between 3.16 and 3.17 the following patch
> >landed:
> >
> >ce363c2 ideapad-laptop: Change Lenovo Yoga 2 series rfkill handling
> >
> >Which changes the name of the dmi_system_id struct from rfkill_blacklist to
> >no_hw_rfkill_list.
> >
> >Following that, there were several additions to the list which should be applied
> >before this patch to each stable kernel for which they haven't been picked up in
> >order for this one to apply cleanly. Several of those are included below:
> >
> 
> Despite the change in the no_hw_rfkill_list, GNU patch still yields the
> correct output but with fuzz. I interpret apply cleanly to mean that
> the patch must also apply with zero fuzz, such as with "patch -F 0".
> 
> In the case where the context has changed (including changes to an
> enclosing struct or function), I gather that a patch exactly modified
> for an older kernel is to be sent to stable@vger.kernel.org after the
> unmodified patch is accepted upstream with a commit ID.
> 
> >$ git l v3.17.. drivers/platform/x86/ideapad-laptop.c
> [...]
> 
> >If you are going to specify a kernel version, you should also include the
> >commits above necessary to make the patch apply cleanly. That would be a long
> >list as you would need many of these for each version.
> >
> 
> Thank you for that information. One commit is sufficient to apply the patch
> to all kernel versions without fuzz:
> 
> 4fa9dab ideapad_laptop: Lenovo G50-30 fix rfkill reports wireless blocked

This does not yield correct results for me on 3.17 (or 3.17.8). Do you get
different results from the following?

dvhart@dvhart-mobl5:~/source/linux/linux-pdx86 [testing]
$ git co -b 3.17 v3.17
Checking out files: 100% (36214/36214), done.
Switched to a new branch '3.17'

dvhart@dvhart-mobl5:~/source/linux/linux-pdx86 [3.17]
$ git cp 4fa9dab
[3.17 d2cdd70] ideapad_laptop: Lenovo G50-30 fix rfkill reports wireless blocked
 Author: Dmitry Tunin <hanipouspilot@gmail.com>
 Date: Sun Jan 18 15:44:40 2015 +0300
 1 file changed, 7 insertions(+)

dvhart@dvhart-mobl5:~/source/linux/linux-pdx86 [3.17]
$ git am ~/incoming/PATCH_v5_1-1_ideapad-laptop_Add_ideapad_Y700_15_to_the_no_hw_rfkill_DMI_list.mbox
Applying: ideapad-laptop: Add ideapad Y700 (15) to the no_hw_rfkill DMI list
error: patch failed: drivers/platform/x86/ideapad-laptop.c:864
error: drivers/platform/x86/ideapad-laptop.c: patch does not apply
Patch failed at 0001 ideapad-laptop: Add ideapad Y700 (15) to the no_hw_rfkill DMI list
The copy of the patch that failed is found in:
   /home/dvhart/source/linux/linux-pdx86/.git/rebase-apply/patch
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".

dvhart@dvhart-mobl5:~/source/linux/linux-pdx86 [3.17|AM 1/1]
$ patch -p1 < ~/incoming/PATCH_v5_1-1_ideapad-laptop_Add_ideapad_Y700_15_to_the_no_hw_rfkill_DMI_list.mbox 
patching file drivers/platform/x86/ideapad-laptop.c
Hunk #1 succeeded at 864 with fuzz 2.


$ cat drivers/platform/x86/ideapad-laptop.c | head -n 880 | tail -n 32

static int ideapad_acpi_add(struct platform_device *pdev)
{
	int ret, i;
	int cfg;
	struct ideapad_private *priv;
	struct acpi_device *adev;

	ret = acpi_bus_get_device(ACPI_HANDLE(&pdev->dev), &adev);
	if (ret)
		return -ENODEV;

	if (read_method_int(adev->handle, "_CFG", &cfg))
		return -ENODEV;

	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
	if (!priv)
	},
	{
		.ident = "Lenovo ideapad Y700-15ISK",
		.matches = {
			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
			DMI_MATCH(DMI_PRODUCT_VERSION, "Lenovo ideapad Y700-15ISK"),
		},
	},
	{
		.ident = "Lenovo ideapad Y700 Touch-15ISK",
		.matches = {
			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
			DMI_MATCH(DMI_PRODUCT_VERSION, "Lenovo ideapad Y700 Touch-15ISK"),
		},
		return -ENOMEM;


Note that the DMI match blocks were stuffed in the middle of the
ideapad_acpi_add() function instead of the no_hw_rfkill.

> 
> >What I'm going to do is include a single Cc to stable line without a kernel
> >version. The maintainers will pull that back as far as they can using their own
> >judgement. If you want this to go back earlier than they do on their own, you
> >should submit it to linux-stable directly and include the Cc lines for the
> >dependencies for each kernel you care to see this backported to. See the
> >stable-kernel-rules for the specific formatting to accomplish this.
> >
> 
> I've submitted v5 of the patch with a single Cc line with the prerequisite
> kernel(s) and commit ID specified exactly.
> 
> Kind regards,
> 
> John
> 

-- 
Darren Hart
Intel Open Source Technology Center
