From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] platform/x86: mlx-platform: make a couple of structures static
Date: Sat, 7 Oct 2017 17:03:41 +0300
Message-ID: <CAHp75Vf8k-hmk4n86foSfSPZxVUQJmGNFkf8ExUKbF2nXaSy8A@mail.gmail.com>
References: <20171005104211.30440-1-colin.king@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <kernel-janitors-owner@vger.kernel.org>
In-Reply-To: <20171005104211.30440-1-colin.king@canonical.com>
Sender: kernel-janitors-owner@vger.kernel.org
To: Colin King <colin.king@canonical.com>
Cc: Vadim Pasternak <vadimp@mellanox.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, kernel-janitors@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Thu, Oct 5, 2017 at 1:42 PM, Colin King <colin.king@canonical.com> wrote:
> From: Colin Ian King <colin.king@canonical.com>
>
> The structures mlxplat_dev and mlxplat_hotplug are local to the source
> and do not need to be in global scope, so make them static.
>
> Cleans up sparse warnings:
> symbol 'mlxplat_dev' was not declared. Should it be static?
> symbol 'mlxplat_hotplug' was not declared. Should it be static?

Thanks for the patch.
Since Vadim did some rather big driver changes I would like to hear
from him how to proceed with this one: either I apply it now, or after
we get Vadim's series in.

-- 
With Best Regards,
Andy Shevchenko
