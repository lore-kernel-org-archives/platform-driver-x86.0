From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v3 08/11] platform/x86: asus-wmi: Enhance detection of
 thermal data
Date: Thu, 9 May 2019 20:54:36 +0300
Message-ID: <CAHp75VcgjF7uQAbdA74vivBaVvdto+1PXRX2_QZA=Gwu0BsAdA@mail.gmail.com>
References: <7acd57fe-604a-a96a-4ca2-a25bc88d6405@gmail.com>
 <7595c4f0-3dbb-2fe5-4daf-4b9a266f67d7@gmail.com> <CAHp75VdE7MBjyLj=9bS6oc5jc8+BC_hftWUJgZGG02iDd=saiQ@mail.gmail.com>
 <0d7f6a9e-d508-65ba-9646-39f1d1a42a13@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <0d7f6a9e-d508-65ba-9646-39f1d1a42a13@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Yurii Pavlovskyi <yurii.pavlovskyi@gmail.com>
Cc: Corentin Chary <corentin.chary@gmail.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Daniel Drake <drake@endlessm.com>, acpi4asus-user <acpi4asus-user@lists.sourceforge.net>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Thu, May 9, 2019 at 8:49 PM Yurii Pavlovskyi
<yurii.pavlovskyi@gmail.com> wrote:
> On 08.05.19 15:58, Andy Shevchenko wrote:

> Yes, looking at this patch now I'd guess the refactoring there is really
> misguided as it adds a lot more code than it removes, will drop it
> completely and just add a new condition to the current check instead in
> next version:
> -               /* If value is zero, something is clearly wrong */
> -               if (!value)
> +               if (!value || value == 1)

Perhaps here makes sense to explicitly show value == 0.

-- 
With Best Regards,
Andy Shevchenko
