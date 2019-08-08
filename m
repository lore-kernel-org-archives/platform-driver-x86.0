From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH 0/2] intel-hid: intel-vbtn: Suspend-related fix and update
Date: Thu, 8 Aug 2019 14:19:41 +0300
Message-ID: <20190808111941.GJ30120@smile.fi.intel.com>
References: <1717835.1Yz4jNODO2@kreacher>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1717835.1Yz4jNODO2@kreacher>
Sender: linux-kernel-owner@vger.kernel.org
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Linux PM <linux-pm@vger.kernel.org>, Linux ACPI <linux-acpi@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Thu, Aug 08, 2019 at 10:40:19AM +0200, Rafael J. Wysocki wrote:
> Hi,
> 
> These two patches fix a minor issue related to system suspend in the intel-hid
> and intel-vbtn drivers and update the suspend/resume handling in intel-hid to
> reduce special-casing in it somewhat.
> 

AFAIR the original patches go via other than PDx86 tree.
Thus, while patches are looking good to me,

Acked-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

> Please refer to the changelogs for details.

-- 
With Best Regards,
Andy Shevchenko
