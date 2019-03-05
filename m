From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v10] platform/mellanox: Add TmFifo driver for Mellanox
 BlueField Soc
Date: Tue, 5 Mar 2019 17:34:16 +0200
Message-ID: <CAHp75VdnAaL0ygbW=8omO4HT2-diV7Dp4twsPsc8GzxtSktpgA@mail.gmail.com>
References: <b143b40446c1870fb8d422b364ead95d54552be9.1527264077.git.lsun@mellanox.com>
 <1551369083-31122-1-git-send-email-lsun@mellanox.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1551369083-31122-1-git-send-email-lsun@mellanox.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Liming Sun <lsun@mellanox.com>
Cc: David Woods <dwoods@mellanox.com>, Andy Shevchenko <andy@infradead.org>, Darren Hart <dvhart@infradead.org>, Vadim Pasternak <vadimp@mellanox.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Thu, Feb 28, 2019 at 5:51 PM Liming Sun <lsun@mellanox.com> wrote:
>
> This commit adds the TmFifo platform driver for Mellanox BlueField
> Soc. TmFifo is a shared FIFO which enables external host machine
> to exchange data with the SoC via USB or PCIe. The driver is based
> on virtio framework and has console and network access enabled.

Thank you for an update.

Unfortunately more work is needed. My comments below.

> +#define MLXBF_TMFIFO_TX_STS__COUNT_RMASK               GENMASK(8, 0)
> +#define MLXBF_TMFIFO_TX_STS__COUNT_MASK                        GENMASK(8, 0)

> +#define MLXBF_TMFIFO_TX_CTL__LWM_RMASK                 GENMASK(7, 0)
> +#define MLXBF_TMFIFO_TX_CTL__LWM_MASK                  GENMASK(7, 0)

> +#define MLXBF_TMFIFO_TX_CTL__HWM_RMASK                 GENMASK(7, 0)
> +#define MLXBF_TMFIFO_TX_CTL__HWM_MASK                  GENMASK(15, 8)

> +#define MLXBF_TMFIFO_TX_CTL__MAX_ENTRIES_RMASK         GENMASK(8, 0)
> +#define MLXBF_TMFIFO_TX_CTL__MAX_ENTRIES_MASK          GENMASK_ULL(40, 32)

> +#define MLXBF_TMFIFO_RX_STS__COUNT_RMASK               GENMASK(8, 0)
> +#define MLXBF_TMFIFO_RX_STS__COUNT_MASK                        GENMASK(8, 0)

> +#define MLXBF_TMFIFO_RX_CTL__LWM_RMASK                 GENMASK(7, 0)
> +#define MLXBF_TMFIFO_RX_CTL__LWM_MASK                  GENMASK(7, 0)

> +#define MLXBF_TMFIFO_RX_CTL__HWM_RMASK                 GENMASK(7, 0)
> +#define MLXBF_TMFIFO_RX_CTL__HWM_MASK                  GENMASK(15, 8)

> +#define MLXBF_TMFIFO_RX_CTL__MAX_ENTRIES_RMASK         GENMASK(8, 0)
> +#define MLXBF_TMFIFO_RX_CTL__MAX_ENTRIES_MASK          GENMASK_ULL(40, 32)

Since two of them have _ULL suffix I'm wondering if you have checked
for side effects on the rest, i.e. if you operate with 64-bit variable
and use something like ~MLXBF_TMFIFO_RX_CTL__MAX_ENTRIES_RMASK, it may
give you interesting results.

> +#define MLXBF_TMFIFO_TIMER_INTERVAL            (HZ / 10)

> +/**
> + * mlxbf_tmfifo_u64 - Union of 64-bit data
> + * @data - 64-bit data in host byte order
> + * @data_le - 64-bit data in little-endian byte order
> + *
> + * It's expected to send 64-bit little-endian value (__le64) into the TmFifo.
> + * readq() and writeq() expect u64 instead. A union structure is used here
> + * to workaround the explicit casting usage like writeq(*(u64 *)&data_le).
> + */

How do you know what readq()/writeq() does with the data? Is it on all
architectures?
How the endianess conversion affects the actual data?

> +union mlxbf_tmfifo_u64 {
> +       u64 data;
> +       __le64 data_le;
> +};

> +/*
> + * Default MAC.
> + * This MAC address will be read from EFI persistent variable if configured.
> + * It can also be reconfigured with standard Linux tools.
> + */
> +static u8 mlxbf_tmfifo_net_default_mac[6] = {
> +       0x00, 0x1A, 0xCA, 0xFF, 0xFF, 0x01};

> +#define mlxbf_vdev_to_tmfifo(dev)      \
> +       container_of(dev, struct mlxbf_tmfifo_vdev, vdev)

One line?

> +/* Return the consumed Tx buffer space. */
> +static int mlxbf_tmfifo_vdev_tx_buf_len(struct mlxbf_tmfifo_vdev *tm_vdev)
> +{
> +       int len;
> +
> +       if (tm_vdev->tx_tail >= tm_vdev->tx_head)
> +               len = tm_vdev->tx_tail - tm_vdev->tx_head;
> +       else
> +               len = MLXBF_TMFIFO_CONS_TX_BUF_SIZE - tm_vdev->tx_head +
> +                       tm_vdev->tx_tail;
> +       return len;
> +}

Is this custom implementation of some kind of circ_buf?

> +/* Allocate vrings for the fifo. */
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

And how do you clean previously allocated items?

> +                       return -ENOMEM;
> +               }
> +
> +               vring->va = va;
> +               vring->dma = dma;
> +       }
> +
> +       return 0;
> +}

> +/* Disable interrupts of the fifo device. */
> +static void mlxbf_tmfifo_disable_irqs(struct mlxbf_tmfifo *fifo)
> +{
> +       int i, irq;
> +
> +       for (i = 0; i < MLXBF_TM_MAX_IRQ; i++) {
> +               irq = fifo->irq_info[i].irq;

> +               if (irq) {

I don't think this check is needed if you can guarantee that it has no
staled records.

> +                       fifo->irq_info[i].irq = 0;
> +                       disable_irq(irq);
> +               }
> +       }
> +}

> +/* Get the number of available words in the TmFifo for sending. */
> +static int mlxbf_tmfifo_get_tx_avail(struct mlxbf_tmfifo *fifo, int vdev_id)
> +{
> +       int tx_reserve;
> +       u64 sts;
> +
> +       /* Reserve some room in FIFO for console messages. */
> +       if (vdev_id == VIRTIO_ID_NET)
> +               tx_reserve = fifo->tx_fifo_size / MLXBF_TMFIFO_RESERVE_RATIO;
> +       else
> +               tx_reserve = 1;
> +
> +       sts = readq(fifo->tx_base + MLXBF_TMFIFO_TX_STS);

> +       return (fifo->tx_fifo_size - tx_reserve -
> +               FIELD_GET(MLXBF_TMFIFO_TX_STS__COUNT_MASK, sts));

Redundant parens.
Moreover, consider

u32 count; // or whatever suits for FIELD_GET().
...

sts = readq(...);
count = FIELD_GET(...);
return ...;

> +}

> +       while (size > 0) {
> +               addr = cons->tx_buf + cons->tx_head;
> +
> +               if (cons->tx_head + sizeof(u64) <=
> +                   MLXBF_TMFIFO_CONS_TX_BUF_SIZE) {
> +                       memcpy(&data, addr, sizeof(u64));
> +               } else {
> +                       partial = MLXBF_TMFIFO_CONS_TX_BUF_SIZE - cons->tx_head;
> +                       memcpy(&data, addr, partial);

> +                       memcpy((u8 *)&data + partial, cons->tx_buf,
> +                              sizeof(u64) - partial);

Unaligned access?!

> +               }

> +               buf.data = readq(fifo->rx_base + MLXBF_TMFIFO_RX_DATA);
> +               buf.data = le64_to_cpu(buf.data_le);

Are you sure this is correct?
How did you test this on BE architectures?

> +       tm_vdev = devm_kzalloc(dev, sizeof(*tm_vdev), GFP_KERNEL);

Is it appropriate use of devm_* ?

> +       if (!tm_vdev) {
> +               ret = -ENOMEM;
> +               goto fail;
> +       }

> +/* Read the configured network MAC address from efi variable. */
> +static void mlxbf_tmfifo_get_cfg_mac(u8 *mac)
> +{
> +       efi_guid_t guid = EFI_GLOBAL_VARIABLE_GUID;
> +       efi_status_t status;
> +       unsigned long size;

> +       u8 buf[6];

ETH_ALEN ?

> +
> +       size = sizeof(buf);

Ditto.

> +       status = efi.get_variable(mlxbf_tmfifo_efi_name, &guid, NULL, &size,
> +                                 buf);

> +       if (status == EFI_SUCCESS && size == sizeof(buf))

Ditto.

> +               memcpy(mac, buf, sizeof(buf));

ether_addr_copy().

> +}

> +       memcpy(net_config.mac, mlxbf_tmfifo_net_default_mac, 6);

ether_addr_copy()...

> +       mlxbf_tmfifo_get_cfg_mac(net_config.mac);

... but actually above should be part of this function.

-- 
With Best Regards,
Andy Shevchenko
