From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [RFC PATCH linux-next] platform/x86: thinkpad_acpi:
 dev_attr_charge_start_threshold can be static
Date: Sat, 1 Aug 2020 14:45:57 +0300
Message-ID: <CAHp75VcCa4whJ7ry9uU+14suLbGPvKgRFJku3dC+dPVNzc0d5Q@mail.gmail.com>
References: <202008011649.b8CEYWIz%lkp@intel.com> <20200801083654.GA31368@144836a6079b>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200801083654.GA31368@144836a6079b>
Sender: linux-kernel-owner@vger.kernel.org
To: kernel test robot <lkp@intel.com>
Cc: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, kbuild-all@lists.01.org, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, Darren Hart <dvhart@infradead.org>, Thinkpad-acpi devel ML <ibm-acpi-devel@lists.sourceforge.net>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Sat, Aug 1, 2020 at 11:38 AM kernel test robot <lkp@intel.com> wrote:

Thanks and sorry folks, Hulk robot was faster, and TBH their patch
looks much better (proper commit message applied). Perhaps something
LKP should work on?

> Fixes: e33929537b76 ("platform/x86: thinkpad_acpi: use standard charge control attribute names")
> Signed-off-by: kernel test robot <lkp@intel.com>


-- 
With Best Regards,
Andy Shevchenko
