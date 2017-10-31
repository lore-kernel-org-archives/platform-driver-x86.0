From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] platform: x86: dell-smo8800: remove redundant assignments
 to byte_data
Date: Tue, 31 Oct 2017 15:47:58 +0200
Message-ID: <CAHp75Vec3Hjd_keMid-x6ub5ZJqUmq1nUFiHPsxuWt8V+vzrnQ@mail.gmail.com>
References: <20171031110318.20985-1-colin.king@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171031110318.20985-1-colin.king@canonical.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Colin King <colin.king@canonical.com>
Cc: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali.rohar@gmail.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, kernel-janitors@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Tue, Oct 31, 2017 at 1:03 PM, Colin King <colin.king@canonical.com> wrote:
> From: Colin Ian King <colin.king@canonical.com>
>
> Variable byte_data is being initialized and re-assigned with values that
> are never read. Remove these as these redundant assignments. Cleans up
> clang warning:
>
> drivers/platform/x86/dell-smo8800.c:106:2: warning: Value stored to 'byte_data'
> is never read

Thanks for the patch.

As I read a code it was from the beginning like this. I dunno what was
a motivation of this pieces, thus I would like to hear Pali.

Per se patch looks pretty much good to me.

-- 
With Best Regards,
Andy Shevchenko
