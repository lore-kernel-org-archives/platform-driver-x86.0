From: Benjamin Berg <bberg@redhat.com>
Subject: Re: [External] Re: [PATCH] thinkpad_acpi: Add sysfs entry for
 lcdshadow feature
Date: Fri, 21 Feb 2020 13:45:53 +0100
Message-ID: <eea7179c93b5a5f3766c169f71567e1d75dda304.camel@redhat.com>
References: <20200220074637.7578-1-njoshi1@lenovo.com>
         <CAHp75VcJmEOu1-b7F2UAsv=Gujb=pPLzjz2ye9t4=Q68+ors-w@mail.gmail.com>
         <HK2PR0302MB25937E2946BF38583B3A905DBD130@HK2PR0302MB2593.apcprd03.prod.outlook.com>
         <CACK8Z6GwuOnJUUscriGwKWGBp5PFKyuqUkFYC8tEXa0UEuEZww@mail.gmail.com>
         <PS1PR0302MB260492DDE243BE0A64A39AA7BD130@PS1PR0302MB2604.apcprd03.prod.outlook.com>
         <CACK8Z6HWkafL4EzOndRyiA3k-VyUg8bQ=2diw_wJSxSTyqsE+w@mail.gmail.com>
         <87tv3kxgyx.fsf@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <87tv3kxgyx.fsf@intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jani Nikula <jani.nikula@linux.intel.com>, Rajat Jain <rajatja@google.com>, Mark Pearson <mpearson@lenovo.com>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, Nitin Joshi <nitjoshi@gmail.com>, Mat King <mathewk@google.com>, Daniel Thompson <daniel.thompson@linaro.org>, Jingoo Han <jingoohan1@gmail.com>, Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Thinkpad-acpi devel ML <ibm-acpi-devel@lists.sourceforge.net>, Platform Driver <platform-driver-x86@vger.kernel.org>, Nitin Joshi1 <njoshi1@lenovo.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Pekka Paalanen <ppaalanen@gmail.com>
List-Id: platform-driver-x86.vger.kernel.org

Hi,

On Fri, 2020-02-21 at 14:28 +0200, Jani Nikula wrote:
> In general I think it's preferrable if the hotkey sends the key event to
> userspace that then makes the policy decision of what, if anything, to
> do with it. Everything is much easier if the policy is in userspace
> control. For example, you could define content based policies for
> enabling privacy screen, something that is definitely not possible with
> firmware.
> 
> I emphatize with the desire to just bypass everything at the
> hardware/firmware level, because that is totally in your control (as an
> OEM), and requires no interaction with the operating system
> initially. Exposing the read-only state of the privacy screen is
> helpful, but prevents the OS from building more advanced features on
> top, failing to reach the full potential of the nice hardware feature.

There seems to be a slight misunderstanding here. On the Lenovo laptops
the feature is automatically adjusted by the Firmware. However, the
setting itself is read/write and it can also be controlled from
userspace.

In principle, I agree that it makes sense to control these things from
software and have a toggle key event that is send around. It has the
unfortunate disadvantage though that it requires updating the entire
userspace. Including the ugly side effect that we continue to have
trouble to support these things on X11 due protocol restrictions with
"high" key codes (>= 248).

Benjamin
