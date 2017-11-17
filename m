From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] platform/x86: dell-smbios-wmi: Disable userspace
 interface if missing hotfix
Date: Thu, 16 Nov 2017 18:00:23 -0800
Message-ID: <20171117020023.GB22250@fury>
References: <1510865310-19893-1-git-send-email-mario.limonciello@dell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([65.50.211.133]:42515 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755146AbdKQCAZ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 16 Nov 2017 21:00:25 -0500
Content-Disposition: inline
In-Reply-To: <1510865310-19893-1-git-send-email-mario.limonciello@dell.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Mario Limonciello <mario.limonciello@dell.com>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org

On Thu, Nov 16, 2017 at 02:48:30PM -0600, Mario Limonciello wrote:
> The Dell SMBIOS WMI interface will fail for some more complex calls unless
> a WMI hotfix has been included.  Most platforms have this fix available in
> a maintenance BIOS release.  In the case the driver is loaded on a
> platform without this fix, disable the userspace interface.
> 
> A hotfix indicator is present in the dell-wmi-descriptor that represents
> whether or not more complex calls will work properly.

Is this "hotfix" the same thing as "having the latest firmware
installed" ?

If so, making that clear in the dev_warn messages would be more useful
to the person reading the log.

> 
> "Simple" calls such as those used by dell-laptop and dell-wmi will continue
> to work properly so dell-smbios-wmi should not be blocked from binding and
> being used as the dell-smbios dispatcher.
> 
> Suggested-by: Girish Prakash <girish.prakash@dell.com>
> Signed-off-by: Mario Limonciello <mario.limonciello@dell.com>
> ---
>  drivers/platform/x86/dell-smbios-wmi.c     | 14 ++++++++++++++
>  drivers/platform/x86/dell-wmi-descriptor.c | 26 ++++++++++++++++++++++++--
>  drivers/platform/x86/dell-wmi-descriptor.h |  1 +
>  3 files changed, 39 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/platform/x86/dell-smbios-wmi.c b/drivers/platform/x86/dell-smbios-wmi.c
> index 8ad11ef..a296551 100644
> --- a/drivers/platform/x86/dell-smbios-wmi.c
> +++ b/drivers/platform/x86/dell-smbios-wmi.c
> @@ -147,9 +147,12 @@ static long dell_smbios_wmi_filter(struct wmi_device *wdev, unsigned int cmd,
>  
>  static int dell_smbios_wmi_probe(struct wmi_device *wdev)
>  {
> +	struct wmi_driver *wdriver =
> +		container_of(wdev->dev.driver, struct wmi_driver, driver);
>  	struct wmi_smbios_priv *priv;
>  	int count;
>  	int ret;
> +	u32 hotfix;

Nit. Please keep local variables in descending order by length.
-- 
Darren Hart
VMware Open Source Technology Center
