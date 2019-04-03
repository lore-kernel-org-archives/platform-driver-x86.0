From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] platform/x86: dell-laptop: fix rfkill functionality
Date: Wed, 3 Apr 2019 13:23:38 -0700
Message-ID: <20190403202338.GB39081@wrath>
References: <1553696734-31282-1-git-send-email-mario.limonciello@dell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1553696734-31282-1-git-send-email-mario.limonciello@dell.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mario Limonciello <mario.limonciello@dell.com>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Wed, Mar 27, 2019 at 09:25:34AM -0500, Mario Limonciello wrote:
> When converting the driver two arguments were transposed leading
> to rfkill not working.
> 
> BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=201427
> Reported-by: Pepijn de Vos <pepijndevos@gmail.com>
> Fixes: 549b49 ("platform/x86: dell-smbios: Introduce dispatcher for SMM calls")
> Signed-off-by: Mario Limonciello <mario.limonciello@dell.com>
> Acked-by: Pali Rohár <pali.rohar@gmail.com>

Looks like this broken in 4.14? So Cc stable back to then? I'm surprised it's
been broken that long :-(

-- 
Darren Hart
VMware Open Source Technology Center
