From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v1 1/1] platform/mellanox: fix the mlx-bootctl sysfs
Date: Fri, 13 Dec 2019 12:21:20 +0200
Message-ID: <CAHp75VcY9syYZoaOLWUHQQ6n5CXwvUnarDJPovLtyLTyZE_ifw@mail.gmail.com>
References: <94727fab054309cd98c876748fd27b130ce5031f.1575918870.git.lsun@mellanox.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <94727fab054309cd98c876748fd27b130ce5031f.1575918870.git.lsun@mellanox.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Liming Sun <lsun@mellanox.com>
Cc: Andy Shevchenko <andy@infradead.org>, Darren Hart <dvhart@infradead.org>, Vadim Pasternak <vadimp@mellanox.com>, David Woods <dwoods@mellanox.com>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Mon, Dec 9, 2019 at 9:24 PM Liming Sun <lsun@mellanox.com> wrote:
>
> This is a follow-up commit for the sysfs attributes to change
> from DRIVER_ATTR to DEVICE_ATTR according to some initial comments.
> In such case, it's better to point the sysfs path to the device
> itself instead of the driver. This commit adds the missing
> sysfs_create_group() so the attributes can be created under the
> device. The ABI document is also updated.
>

Fixes tag, please.

-- 
With Best Regards,
Andy Shevchenko
