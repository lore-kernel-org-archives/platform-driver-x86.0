From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] alienware-wmi: Adjust instance of all
 wmi_evaluate_method calls to 0
Date: Fri, 23 Jun 2017 13:09:53 -0700
Message-ID: <20170623200953.GA1728@fury>
References: <1498082495-3329-1-git-send-email-mario.limonciello@dell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1498082495-3329-1-git-send-email-mario.limonciello@dell.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mario Limonciello <mario.limonciello@dell.com>
Cc: LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Wed, Jun 21, 2017 at 05:01:35PM -0500, Mario Limonciello wrote:
> Pali recently noticed that WMI instances are zero indexed.
> 
> The only reason that these calls all worked properly is because the ASL
> didn't verify the instance number.
> 
> Signed-off-by: Mario Limonciello <mario.limonciello@dell.com>

Thanks Mario,

Queued to testing.

-- 
Darren Hart
VMware Open Source Technology Center
