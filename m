From: Rong Chen <rong.a.chen@intel.com>
Subject: Re: [kbuild-all] Re: [RFC PATCH linux-next] platform/x86:
 thinkpad_acpi: dev_attr_charge_start_threshold can be static
Date: Mon, 3 Aug 2020 08:23:00 +0800
Message-ID: <095dca8b-e54c-1b5b-4b40-ff3ce43d377e@intel.com>
References: <202008011649.b8CEYWIz%lkp@intel.com>
 <20200801083654.GA31368@144836a6079b>
 <CAHp75VcCa4whJ7ry9uU+14suLbGPvKgRFJku3dC+dPVNzc0d5Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAHp75VcCa4whJ7ry9uU+14suLbGPvKgRFJku3dC+dPVNzc0d5Q@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>, kernel test robot <lkp@intel.com>
Cc: =?UTF-8?Q?Thomas_Wei=c3=9fschuh?= <linux@weissschuh.net>, kbuild-all@lists.01.org, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, Darren Hart <dvhart@infradead.org>, Thinkpad-acpi devel ML <ibm-acpi-devel@lists.sourceforge.net>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org



On 8/1/20 7:45 PM, Andy Shevchenko wrote:
> On Sat, Aug 1, 2020 at 11:38 AM kernel test robot <lkp@intel.com> wrote:
>
> Thanks and sorry folks, Hulk robot was faster, and TBH their patch
> looks much better (proper commit message applied). Perhaps something
> LKP should work on?

Hi Andy,

Thanks for the advice, we'll improve the commit message.

Best Regards,
Rong Chen

>
>> Fixes: e33929537b76 ("platform/x86: thinkpad_acpi: use standard charge control attribute names")
>> Signed-off-by: kernel test robot <lkp@intel.com>
>
