From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v13] platform/mellanox: Add TmFifo driver for Mellanox
 BlueField Soc
Date: Fri, 5 Apr 2019 18:44:14 +0300
Message-ID: <CAHp75VdUwn1NEpSc0_Oc4wEh0TRzCwcE0_tajg3ak8BjfZ_-Mw@mail.gmail.com>
References: <b143b40446c1870fb8d422b364ead95d54552be9.1527264077.git.lsun@mellanox.com>
 <1554406595-3128-1-git-send-email-lsun@mellanox.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1554406595-3128-1-git-send-email-lsun@mellanox.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Liming Sun <lsun@mellanox.com>
Cc: David Woods <dwoods@mellanox.com>, Andy Shevchenko <andy@infradead.org>, Darren Hart <dvhart@infradead.org>, Vadim Pasternak <vadimp@mellanox.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Thu, Apr 4, 2019 at 10:36 PM Liming Sun <lsun@mellanox.com> wrote:
> This commit adds the TmFifo platform driver for Mellanox BlueField
> Soc. TmFifo is a shared FIFO which enables external host machine
> to exchange data with the SoC via USB or PCIe. The driver is based
> on virtio framework and has console and network access enabled.

Thanks for an update. Almost good.
My comments below.

Meanwhile I pushed this to my review and testing queue, thanks!

> +#include <linux/acpi.h>
> +#include <linux/bitfield.h>
> +#include <linux/circ_buf.h>
> +#include <linux/efi.h>
> +#include <linux/irq.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/platform_device.h>
> +#include <linux/types.h>

Perhaps blank line here. Would be more clear that this is utilizing
virtio framework.

> +#include <linux/virtio_config.h>
> +#include <linux/virtio_console.h>
> +#include <linux/virtio_ids.h>
> +#include <linux/virtio_net.h>
> +#include <linux/virtio_ring.h>

> +/**
> + * mlxbf_tmfifo_msg_hdr - Structure of the TmFifo message header
> + * @type: message type
> + * @len: payload length
> + * @u: 64-bit union data
> + */
> +union mlxbf_tmfifo_msg_hdr {
> +       struct {
> +               u8 type;
> +               __be16 len;
> +               u8 unused[5];
> +       } __packed;
> +       u64 data;

I'm not sure I understand how you can distinguish which field of union to use?
Isn't here some type missed?

> +};

> +static u8 mlxbf_tmfifo_net_default_mac[ETH_ALEN] = {

> +       0x00, 0x1A, 0xCA, 0xFF, 0xFF, 0x01};

This should be two lines.

> +/* Supported virtio-net features. */
> +#define MLXBF_TMFIFO_NET_FEATURES      (BIT_ULL(VIRTIO_NET_F_MTU) | \
> +                                        BIT_ULL(VIRTIO_NET_F_STATUS) | \
> +                                        BIT_ULL(VIRTIO_NET_F_MAC))

Better to write as

#define FOO \
(BIT(x) | BIT(y) ...)

I think I told this earlier?

> +/* Allocate vrings for the fifo. */

fifo -> FIFO (and check all occurrences)

> +static int mlxbf_tmfifo_alloc_vrings(struct mlxbf_tmfifo *fifo,
> +                                    struct mlxbf_tmfifo_vdev *tm_vdev)
> +{
> +       struct mlxbf_tmfifo_vring *vring;
> +       struct device *dev;
> +       dma_addr_t dma;
> +       int i, size;
> +       void *va;
> +
> +       for (i = 0; i < ARRAY_SIZE(tm_vdev->vrings); i++) {
> +               vring = &tm_vdev->vrings[i];
> +               vring->fifo = fifo;
> +               vring->num = MLXBF_TMFIFO_VRING_SIZE;
> +               vring->align = SMP_CACHE_BYTES;
> +               vring->index = i;
> +               vring->vdev_id = tm_vdev->vdev.id.device;
> +               dev = &tm_vdev->vdev.dev;
> +
> +               size = vring_size(vring->num, vring->align);
> +               va = dma_alloc_coherent(dev->parent, size, &dma, GFP_KERNEL);
> +               if (!va) {

> +                       dev_err(dev->parent, "dma_alloc_coherent failed\n");

I don't see how this will free the allocated entries.
I think I told about this either.

> +                       return -ENOMEM;
> +               }
> +
> +               vring->va = va;
> +               vring->dma = dma;
> +       }
> +
> +       return 0;
> +}

> +/* House-keeping timer. */
> +static void mlxbf_tmfifo_timer(struct timer_list *arg)
> +{

> +       struct mlxbf_tmfifo *fifo = container_of(arg, struct mlxbf_tmfifo,
> +                                                timer);

One line would be still good enough.

> +       int more;
> +
> +       more = !test_and_set_bit(MLXBF_TM_RX_HWM_IRQ, &fifo->pend_events) ||
> +                   !test_and_set_bit(MLXBF_TM_TX_LWM_IRQ, &fifo->pend_events);
> +
> +       if (more)
> +               schedule_work(&fifo->work);
> +
> +       mod_timer(&fifo->timer, jiffies + MLXBF_TMFIFO_TIMER_INTERVAL);
> +}

> +       status = efi.get_variable(mlxbf_tmfifo_efi_name, &guid, NULL, &size,
> +                                 buf);
> +       if (status == EFI_SUCCESS && size == ETH_ALEN)
> +               ether_addr_copy(mac, buf);
> +       else

> +               memcpy(mac, mlxbf_tmfifo_net_default_mac, ETH_ALEN);

ether_addr_copy() as well.

> +}

> +       fifo->pdev = pdev;

Do you really need to keep pdev there? Isn't struct device pointer enough?


> +       /* Create the console vdev. */
> +       ret = mlxbf_tmfifo_create_vdev(&pdev->dev, fifo, VIRTIO_ID_CONSOLE, 0,
> +                                      NULL, 0);

If you define temporary variable
  struct device *dev = &pdev->dev;
these lines can be merged into one.

> +       if (ret)
> +               goto fail;

-- 
With Best Regards,
Andy Shevchenko
