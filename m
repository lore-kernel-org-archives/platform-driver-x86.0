From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH v2] platform/x86: dell-smbios-wmi: Disable userspace
 interface if missing hotfix
Date: Fri, 17 Nov 2017 12:39:22 -0800
Message-ID: <20171117203922.GG22250@fury>
References: <1510891992-31659-1-git-send-email-mario.limonciello@dell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1510891992-31659-1-git-send-email-mario.limonciello@dell.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mario Limonciello <mario.limonciello@dell.com>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Thu, Nov 16, 2017 at 10:13:12PM -0600, Mario Limonciello wrote:
> The Dell SMBIOS WMI interface will fail for some more complex calls unless
> a WMI hotfix has been included.  Most platforms have this fix available in
> a maintenance BIOS release.  In the case the driver is loaded on a
> platform without this fix, disable the userspace interface.
> 
> A hotfix indicator is present in the dell-wmi-descriptor that represents
> whether or not more complex calls will work properly.
> 
> "Simple" calls such as those used by dell-laptop and dell-wmi will continue
> to work properly so dell-smbios-wmi should not be blocked from binding and
> being used as the dell-smbios dispatcher.
> 
> Suggested-by: Girish Prakash <girish.prakash@dell.com>
> Signed-off-by: Mario Limonciello <mario.limonciello@dell.com>

Queued up, thanks Mario.
-- 
Darren Hart
VMware Open Source Technology Center
