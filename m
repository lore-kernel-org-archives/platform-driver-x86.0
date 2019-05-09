From: Yurii Pavlovskyi <yurii.pavlovskyi@gmail.com>
Subject: Re: [PATCH v3 05/11] platform/x86: asus-wmi: Support WMI event queue
Date: Thu, 9 May 2019 19:36:59 +0200
Message-ID: <5968d688-dc40-acad-bd73-8fe26cf14979@gmail.com>
References: <7acd57fe-604a-a96a-4ca2-a25bc88d6405@gmail.com>
 <22dc9bfe-af2f-7ea9-e5bc-95647d5411a8@gmail.com>
 <CAHp75VdRE8C=ZODLuKC0JktKv4rbw_Y4fOA4J5wBYKPU+URK+A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAHp75VdRE8C=ZODLuKC0JktKv4rbw_Y4fOA4J5wBYKPU+URK+A@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Corentin Chary <corentin.chary@gmail.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Daniel Drake <drake@endlessm.com>, acpi4asus-user <acpi4asus-user@lists.sourceforge.net>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On 08.05.19 15:47, Andy Shevchenko wrote:
> On Fri, Apr 19, 2019 at 1:10 PM Yurii Pavlovskyi
> <yurii.pavlovskyi@gmail.com> wrote:
> 
> It's rather a big change. Can it be split to smaller pieces?
> 
I will then split this into refactoring event code handling in separate
methods and actual event queue support patches.
