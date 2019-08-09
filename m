From: "Rafael J. Wysocki" <rafael@kernel.org>
Subject: Re: [PATCH 0/2] intel-hid: intel-vbtn: Suspend-related fix and update
Date: Fri, 9 Aug 2019 10:15:21 +0200
Message-ID: <CAJZ5v0h+iHWMkS-vVHUHwd6AmYE2UR_CCoUjhBJH_-ik_jbVQQ@mail.gmail.com>
References: <1717835.1Yz4jNODO2@kreacher> <20190808111941.GJ30120@smile.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190808111941.GJ30120@smile.fi.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: "Rafael J. Wysocki" <rjw@rjwysocki.net>, Platform Driver <platform-driver-x86@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Linux PM <linux-pm@vger.kernel.org>, Linux ACPI <linux-acpi@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Thu, Aug 8, 2019 at 1:19 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Thu, Aug 08, 2019 at 10:40:19AM +0200, Rafael J. Wysocki wrote:
> > Hi,
> >
> > These two patches fix a minor issue related to system suspend in the intel-hid
> > and intel-vbtn drivers and update the suspend/resume handling in intel-hid to
> > reduce special-casing in it somewhat.
> >
>
> AFAIR the original patches go via other than PDx86 tree.

That's correct.

> Thus, while patches are looking good to me,
>
> Acked-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Thanks!
