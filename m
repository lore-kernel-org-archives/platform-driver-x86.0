From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v3 07/11] platform/x86: asus-wmi: Organize code into sections
Date: Wed, 8 May 2019 16:46:02 +0300
Message-ID: <CAHp75VeWiP57iT_75F7mYNKAbBhxkzpBcWhJDd=tkVZb68uXgA@mail.gmail.com>
References: <7acd57fe-604a-a96a-4ca2-a25bc88d6405@gmail.com> <9a4351a5-ab04-2ebb-9961-1c50dda9800d@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <9a4351a5-ab04-2ebb-9961-1c50dda9800d@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Yurii Pavlovskyi <yurii.pavlovskyi@gmail.com>
Cc: Corentin Chary <corentin.chary@gmail.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Daniel Drake <drake@endlessm.com>, acpi4asus-user <acpi4asus-user@lists.sourceforge.net>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Fri, Apr 19, 2019 at 1:12 PM Yurii Pavlovskyi
<yurii.pavlovskyi@gmail.com> wrote:
>
> The driver has grown pretty big and will grow more, which makes it hard to
> navigate and understand. Add uniform comments to the code and ensure that
> it is sorted into logical sections.

It does slightly more than described. Please, split out to the
separate patch(es) what is not suit to above description.

-- 
With Best Regards,
Andy Shevchenko
