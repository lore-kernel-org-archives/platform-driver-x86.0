From: Liming Sun <lsun@mellanox.com>
Subject: RE: [PATCH v9] platform/mellanox: Add TmFifo driver for Mellanox
 BlueField Soc
Date: Thu, 28 Feb 2019 15:51:12 +0000
Message-ID: <DB6PR05MB3223853F60C209A286617923A1600@DB6PR05MB3223.eurprd05.prod.outlook.com>
References: <b143b40446c1870fb8d422b364ead95d54552be9.1527264077.git.lsun@mellanox.com>
 <1550064437-1363-1-git-send-email-lsun@mellanox.com>
 <CAHp75VeasVqg0MJ9_WSGLocd16m1iu32xHd9KYvNu0+kQ9MfVA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAHp75VeasVqg0MJ9_WSGLocd16m1iu32xHd9KYvNu0+kQ9MfVA@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: David Woods <dwoods@mellanox.com>, Andy Shevchenko <andy@infradead.org>, Darren Hart <dvhart@infradead.org>, Vadim Pasternak <vadimp@mellanox.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

Thanks Andy for the comments. Please see the responses below.
I'll also post the v10 patch after this email.

Regards,
Liming

> -----Original Message-----
> From: Andy Shevchenko <andy.shevchenko@gmail.com>
> Sent: Wednesday, February 13, 2019 1:11 PM
> To: Liming Sun <lsun@mellanox.com>
> Cc: David Woods <dwoods@mellanox.com>; Andy Shevchenko <andy@infradead.or=
g>; Darren Hart <dvhart@infradead.org>; Vadim
> Pasternak <vadimp@mellanox.com>; Linux Kernel Mailing List <linux-kernel@=
vger.kernel.org>; Platform Driver <platform-driver-
> x86@vger.kernel.org>
> Subject: Re: [PATCH v9] platform/mellanox: Add TmFifo driver for Mellanox=
 BlueField Soc
>=20
> On Wed, Feb 13, 2019 at 3:27 PM Liming Sun <lsun@mellanox.com> wrote:
> >
> > This commit adds the TmFifo platform driver for Mellanox BlueField
> > Soc. TmFifo is a shared FIFO which enables external host machine
> > to exchange data with the SoC via USB or PCIe. The driver is based
> > on virtio framework and has console and network access enabled.
>=20
> Thanks for an update, my comments below.
>=20
> Again, to Mellanox: guys, please, establish internal mailing list for
> review and don't come with such quality of code.

Yes, the patch went through internal review. I updated the=20
Reviewed-by section of the commit message.

>=20
> Next time I would like to see Reviewed-by from Mellanox people I know,
> like Vadim or Leon.
>=20
> > +config MLXBF_TMFIFO
> > +       tristate "Mellanox BlueField SoC TmFifo platform driver"
>=20
> > +       depends on ARM64 && ACPI && VIRTIO_CONSOLE && VIRTIO_NET
>=20
> Split this to three logical parts.

Updated in v10.

>=20
> > +       help
> > +         Say y here to enable TmFifo support. The TmFifo driver provid=
es
> > +          platform driver support for the TmFifo which supports consol=
e
> > +          and networking based on the virtio framework.
>=20
> >  obj-$(CONFIG_MLXREG_HOTPLUG)   +=3D mlxreg-hotplug.o
> >  obj-$(CONFIG_MLXREG_IO) +=3D mlxreg-io.o
> > +obj-$(CONFIG_MLXBF_TMFIFO)     +=3D mlxbf-tmfifo.o
>=20
> I would suggest to keep it sorted.

Updated in v10.

>=20
> > +#define MLXBF_TMFIFO_TX_DATA 0x0
>=20
> I suggest to use same fixed format for offsets.
> Here, for example, 0x00 would be better.
>=20
> > +#define MLXBF_TMFIFO_TX_STS__COUNT_RMASK 0x1ff
> > +#define MLXBF_TMFIFO_TX_STS__COUNT_MASK  0x1ff
>=20
> #include <linux/bits.h>
> ...
> GENMASK()

Updated in v10.

>=20
> > +#define MLXBF_TMFIFO_TX_CTL__LWM_RMASK 0xff
> > +#define MLXBF_TMFIFO_TX_CTL__LWM_MASK  0xff
>=20
> > +#define MLXBF_TMFIFO_TX_CTL__HWM_RMASK 0xff
> > +#define MLXBF_TMFIFO_TX_CTL__HWM_MASK  0xff00
>=20
> > +#define MLXBF_TMFIFO_TX_CTL__MAX_ENTRIES_RMASK 0x1ff
> > +#define MLXBF_TMFIFO_TX_CTL__MAX_ENTRIES_MASK  0x1ff00000000ULL
>=20
> GENMASK() / GENMASK_ULL()

Updated in v10.

>=20
> > +#define MLXBF_TMFIFO_RX_STS__COUNT_RMASK 0x1ff
> > +#define MLXBF_TMFIFO_RX_STS__COUNT_MASK  0x1ff
>=20
> GENMASK()

Updated in v10.

>=20
> > +#define MLXBF_TMFIFO_RX_CTL__LWM_RMASK 0xff
> > +#define MLXBF_TMFIFO_RX_CTL__LWM_MASK  0xff
>=20
> > +#define MLXBF_TMFIFO_RX_CTL__HWM_RMASK 0xff
> > +#define MLXBF_TMFIFO_RX_CTL__HWM_MASK  0xff00
>=20
> > +#define MLXBF_TMFIFO_RX_CTL__MAX_ENTRIES_RMASK 0x1ff
> > +#define MLXBF_TMFIFO_RX_CTL__MAX_ENTRIES_MASK  0x1ff00000000ULL
>=20
> Ditto.

Updated in v10.

>=20
> > +#include <linux/acpi.h>
> > +#include <linux/byteorder/generic.h>
> > +#include <linux/bitfield.h>
> > +#include <linux/cache.h>
> > +#include <linux/device.h>
> > +#include <linux/dma-mapping.h>
> > +#include <linux/efi.h>
> > +#include <linux/io.h>
> > +#include <linux/interrupt.h>
> > +#include <linux/irq.h>
> > +#include <linux/kernel.h>
> > +#include <linux/math64.h>
> > +#include <linux/module.h>
> > +#include <linux/moduleparam.h>
> > +#include <linux/mutex.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/resource.h>
> > +#include <linux/slab.h>
> > +#include <linux/types.h>
> > +#include <linux/version.h>
> > +#include <linux/virtio.h>
> > +#include <linux/virtio_config.h>
> > +#include <linux/virtio_console.h>
> > +#include <linux/virtio_ids.h>
> > +#include <linux/virtio_net.h>
> > +#include <linux/virtio_ring.h>
>=20
> Do you need all of them?

Cleaned up quite a few and updated in v10.

>=20
> > +#define MLXBF_TMFIFO_VRING_SIZE                        1024
>=20
> SZ_1K ?

Updated in v10.

>=20
> > +/* Console Tx buffer size. */
> > +#define MLXBF_TMFIFO_CONS_TX_BUF_SIZE          (32 * 1024)
>=20
> SZ_32K ?

Updated in v10.

>=20
> > +/* House-keeping timer interval. */
> > +static int mlxbf_tmfifo_timer_interval =3D HZ / 10;
>=20
> > +/* Global lock. */
>=20
> Noise. Either explain what it protects, or remove.

Removed in v10.

>=20
> > +static DEFINE_MUTEX(mlxbf_tmfifo_lock);
>=20
> > +/* Struct declaration. */
>=20
> Noise.

Removed in v10.

>=20
> > +/* Structure to maintain the ring state. */
> > +struct mlxbf_tmfifo_vring {
> > +       void *va;                       /* virtual address */
> > +       dma_addr_t dma;                 /* dma address */
> > +       struct virtqueue *vq;           /* virtqueue pointer */
> > +       struct vring_desc *desc;        /* current desc */
> > +       struct vring_desc *desc_head;   /* current desc head */
> > +       int cur_len;                    /* processed len in current des=
c */
> > +       int rem_len;                    /* remaining length to be proce=
ssed */
> > +       int size;                       /* vring size */
> > +       int align;                      /* vring alignment */
> > +       int id;                         /* vring id */
> > +       int vdev_id;                    /* TMFIFO_VDEV_xxx */
> > +       u32 pkt_len;                    /* packet total length */
> > +       u16 next_avail;                 /* next avail desc id */
> > +       struct mlxbf_tmfifo *fifo;      /* pointer back to the tmfifo *=
/
> > +};
>=20
> Perhaps kernel-doc?

Updated in v10.

>=20
> > +/* Interrupt types. */
> > +enum {
> > +       MLXBF_TM_RX_LWM_IRQ,            /* Rx low water mark irq */
> > +       MLXBF_TM_RX_HWM_IRQ,            /* Rx high water mark irq */
> > +       MLXBF_TM_TX_LWM_IRQ,            /* Tx low water mark irq */
> > +       MLXBF_TM_TX_HWM_IRQ,            /* Tx high water mark irq */
> > +       MLXBF_TM_IRQ_CNT
>=20
> CNT...
>=20
> > +};
> > +
> > +/* Ring types (Rx & Tx). */
> > +enum {
> > +       MLXBF_TMFIFO_VRING_RX,          /* Rx ring */
> > +       MLXBF_TMFIFO_VRING_TX,          /* Tx ring */
> > +       MLXBF_TMFIFO_VRING_NUM
>=20
> ...NUM
>=20
> Perhaps one style for max numbers?

Updated in v10.

>=20
> > +};
>=20
> > +
> > +/* Structure for the virtual device. */
> > +struct mlxbf_tmfifo_vdev {
> > +       struct virtio_device vdev;      /* virtual device */
> > +       u8 status;
> > +       u64 features;
> > +       union {                         /* virtio config space */
> > +               struct virtio_console_config cons;
> > +               struct virtio_net_config net;
> > +       } config;
>=20
> Describe, which field allows to distinguish what type of the data is in a=
 union.

Added comments in v10.

>=20
> > +       struct mlxbf_tmfifo_vring vrings[MLXBF_TMFIFO_VRING_NUM];
> > +       u8 *tx_buf;                     /* tx buffer */
> > +       u32 tx_head;                    /* tx buffer head */
> > +       u32 tx_tail;                    /* tx buffer tail */
> > +};
>=20
> kernel-doc?

Updated in v10

>=20
> > +/* Structure of the interrupt information. */
> > +struct mlxbf_tmfifo_irq_info {
> > +       struct mlxbf_tmfifo *fifo;      /* tmfifo structure */
> > +       int irq;                        /* interrupt number */
> > +       int index;                      /* array index */
> > +};
>=20
> Ditto.

Updated in v10

>=20
> > +
> > +/* Structure of the TmFifo information. */
> > +struct mlxbf_tmfifo {
> > +       struct mlxbf_tmfifo_vdev *vdev[MLXBF_TMFIFO_VDEV_MAX]; /* devic=
es */
> > +       struct platform_device *pdev;   /* platform device */
> > +       struct mutex lock;              /* fifo lock */
> > +       void __iomem *rx_base;          /* mapped register base */
> > +       void __iomem *tx_base;          /* mapped register base */
> > +       int tx_fifo_size;               /* number of entries of the Tx =
FIFO */
> > +       int rx_fifo_size;               /* number of entries of the Rx =
FIFO */
> > +       unsigned long pend_events;      /* pending bits for deferred pr=
ocess */
> > +       struct mlxbf_tmfifo_irq_info irq_info[MLXBF_TM_IRQ_CNT]; /* irq=
 info */
> > +       struct work_struct work;        /* work struct for deferred pro=
cess */
> > +       struct timer_list timer;        /* keepalive timer */
> > +       struct mlxbf_tmfifo_vring *vring[2];    /* current Tx/Rx ring *=
/
> > +       bool is_ready;                  /* ready flag */
> > +       spinlock_t spin_lock;           /* spin lock */
> > +};
>=20
> Ditto.

Updated in v10

>=20
> > +/* Use a union struction for 64-bit little/big endian. */
>=20
> What does this mean?

Updated in v10 with the following comments to explain it.
/*
 * It's expected to send 64-bit little-endian value (__le64) into the TmFif=
o.
 * readq() and writeq() expect u64 instead. A union structure is used here
 * to workaround the explicit casting usage like writeq(*(u64 *)&data_le).
 */

>=20
> > +union mlxbf_tmfifo_data_64bit {
> > +       u64 data;
> > +       __le64 data_le;
> > +};
> > +
> > +/* Message header used to demux data in the TmFifo. */
> > +union mlxbf_tmfifo_msg_hdr {
> > +       struct {
> > +               u8 type;                /* message type */
> > +               __be16 len;             /* payload length */
> > +               u8 unused[5];           /* reserved, set to 0 */
> > +       } __packed;
>=20
> It's already packed. No?

It's not packed by default due to the 16-bit len. We need the '__packed'
to make sure the size of the structure is 8 bytes.

>=20
> > +       union mlxbf_tmfifo_data_64bit u;        /* 64-bit data */
> > +};
>=20
> > +/* MTU setting of the virtio-net interface. */
> > +#define MLXBF_TMFIFO_NET_MTU           1500
>=20
> Don't we have this globally defined?

Updated in v10

>=20
> > +/* Supported virtio-net features. */
> > +#define MLXBF_TMFIFO_NET_FEATURES      ((1UL << VIRTIO_NET_F_MTU) | \
> > +                                        (1UL << VIRTIO_NET_F_STATUS) |=
 \
> > +                                        (1UL << VIRTIO_NET_F_MAC))
>=20
> BIT_UL() ?

Updated in v10

>=20
> > +/* Function declarations. */
>=20
> Noise.

Removed in v10

>=20
> > +static int mlxbf_tmfifo_remove(struct platform_device *pdev);
>=20
> Why do you need forward declaration for this?

Removed in v10

>=20
> > +/* Return the consumed Tx buffer space. */
> > +static int mlxbf_tmfifo_vdev_tx_buf_len(struct mlxbf_tmfifo_vdev *vdev=
)
> > +{
> > +       return ((vdev->tx_tail >=3D vdev->tx_head) ?
> > +               (vdev->tx_tail - vdev->tx_head) :
> > +               (MLXBF_TMFIFO_CONS_TX_BUF_SIZE - vdev->tx_head +
> > +                vdev->tx_tail));
>=20
> Split this for better reading.

Updated in v10

>=20
> > +}
> > +
> > +/* Return the available Tx buffer space. */
> > +static int mlxbf_tmfifo_vdev_tx_buf_avail(struct mlxbf_tmfifo_vdev *vd=
ev)
> > +{
> > +       return (MLXBF_TMFIFO_CONS_TX_BUF_RSV_SIZE -
> > +               mlxbf_tmfifo_vdev_tx_buf_len(vdev));
>=20
> Redundant parens.
> Moreover, you might consider temporary variable for better reading.

Updated in v10

>=20
> > +}
> > +
> > +/* Update Rx/Tx buffer index pointer. */
> > +static void mlxbf_tmfifo_vdev_tx_buf_index_inc(u32 *index, u32 len)
> > +{
> > +       *index +=3D len;
> > +       if (*index >=3D MLXBF_TMFIFO_CONS_TX_BUF_SIZE)
> > +               *index -=3D MLXBF_TMFIFO_CONS_TX_BUF_SIZE;
> > +}
> > +
> > +/* Allocate vrings for the fifo. */
> > +static int mlxbf_tmfifo_alloc_vrings(struct mlxbf_tmfifo *fifo,
> > +                                    struct mlxbf_tmfifo_vdev *tm_vdev,
> > +                                    int vdev_id)
> > +{
> > +       struct mlxbf_tmfifo_vring *vring;
> > +       dma_addr_t dma;
> > +       int i, size;
> > +       void *va;
> > +
> > +       for (i =3D 0; i < ARRAY_SIZE(tm_vdev->vrings); i++) {
> > +               vring =3D &tm_vdev->vrings[i];
> > +               vring->fifo =3D fifo;
> > +               vring->size =3D MLXBF_TMFIFO_VRING_SIZE;
> > +               vring->align =3D SMP_CACHE_BYTES;
> > +               vring->id =3D i;
> > +               vring->vdev_id =3D vdev_id;
> > +
>=20
> > +               size =3D PAGE_ALIGN(vring_size(vring->size, vring->alig=
n));
>=20
> Why do you need this?
> dma_alloc_coherent() allocates memory on page granularity anyway.

Updated in v10

>=20
> > +               va =3D dma_alloc_coherent(tm_vdev->vdev.dev.parent, siz=
e, &dma,
> > +                                       GFP_KERNEL);
> > +               if (!va) {
>=20
> > +                       dev_err(tm_vdev->vdev.dev.parent,
>=20
> Would be much easy if you have temporary variable for this device.

Updated in v10

>=20
> > +                               "dma_alloc_coherent failed\n");
> > +                       return -ENOMEM;
> > +               }
> > +
> > +               vring->va =3D va;
> > +               vring->dma =3D dma;
> > +       }
> > +
> > +       return 0;
> > +}
>=20
> > +/* Interrupt handler. */
> > +static irqreturn_t mlxbf_tmfifo_irq_handler(int irq, void *arg)
> > +{
> > +       struct mlxbf_tmfifo_irq_info *irq_info;
> > +
> > +       irq_info =3D (struct mlxbf_tmfifo_irq_info *)arg;
>=20
> Useless casting.
> Assignment can be done in definition block.

Updated in v10

>=20
> > +       if (irq_info->index < MLXBF_TM_IRQ_CNT &&
> > +           !test_and_set_bit(irq_info->index, &irq_info->fifo->pend_ev=
ents))
> > +               schedule_work(&irq_info->fifo->work);
> > +
> > +       return IRQ_HANDLED;
> > +}
> > +
> > +/* Get the next packet descriptor from the vring. */
> > +static struct vring_desc *mlxbf_tmfifo_get_next_desc(struct virtqueue =
*vq)
> > +{
> > +       struct mlxbf_tmfifo_vring *vring;
> > +       unsigned int idx, head;
> > +       struct vring *vr;
> > +
> > +       vr =3D (struct vring *)virtqueue_get_vring(vq);
>=20
> Return type is different? Is it safe to cast? Why?

It's 'const' casting. Fixed in v10 to use 'const struct vring *vr' instead.

>=20
> > +       if (!vr)
> > +               return NULL;
>=20
> + blank line

Updated in v10

>=20
> > +       vring =3D (struct mlxbf_tmfifo_vring *)vq->priv;
>=20
> Do you need explicit casting?

Updated in v10

>=20
> > +       if (vring->next_avail =3D=3D virtio16_to_cpu(vq->vdev, vr->avai=
l->idx))
> > +               return NULL;
>=20
> +blank line

Updated in v10

>=20
> > +       idx =3D vring->next_avail % vr->num;
> > +       head =3D virtio16_to_cpu(vq->vdev, vr->avail->ring[idx]);
> > +       if (WARN_ON(head >=3D vr->num))
> > +               return NULL;
> > +       vring->next_avail++;
> > +
> > +       return &vr->desc[head];
> > +}
> > +
> > +/* Release virtio descriptor. */
> > +static void mlxbf_tmfifo_release_desc(struct virtio_device *vdev,
> > +                                     struct vring *vr, struct vring_de=
sc *desc,
> > +                                     u32 len)
> > +{
> > +       u16 idx, vr_idx;
> > +
> > +       vr_idx =3D virtio16_to_cpu(vdev, vr->used->idx);
> > +       idx =3D vr_idx % vr->num;
> > +       vr->used->ring[idx].id =3D cpu_to_virtio32(vdev, desc - vr->des=
c);
> > +       vr->used->ring[idx].len =3D cpu_to_virtio32(vdev, len);
> > +
> > +       /* Virtio could poll and check the 'idx' to decide
> > +        * whether the desc is done or not. Add a memory
> > +        * barrier here to make sure the update above completes
> > +        * before updating the idx.
> > +        */
>=20
> Multi-line comment style is broken.

Updated in v10

>=20
> > +       mb();
> > +       vr->used->idx =3D cpu_to_virtio16(vdev, vr_idx + 1);
> > +}
>=20
> > +/* House-keeping timer. */
> > +static void mlxbf_tmfifo_timer(struct timer_list *arg)
> > +{
> > +       struct mlxbf_tmfifo *fifo;
>=20
> > +       fifo =3D container_of(arg, struct mlxbf_tmfifo, timer);
>=20
> Can't be done in the definition block?

Updated in v10

>=20
> > +       /*
> > +        * Wake up the work handler to poll the Rx FIFO in case interru=
pt
> > +        * missing or any leftover bytes stuck in the FIFO.
> > +        */
> > +       test_and_set_bit(MLXBF_TM_RX_HWM_IRQ, &fifo->pend_events);
>=20
> How do you utilize test results?

Fixed in v10

>=20
> > +
> > +       /*
> > +        * Wake up Tx handler in case virtio has queued too many packet=
s
> > +        * and are waiting for buffer return.
> > +        */
> > +       test_and_set_bit(MLXBF_TM_TX_LWM_IRQ, &fifo->pend_events);
>=20
> Ditto.

Fixed in v10

>=20
> > +
> > +       schedule_work(&fifo->work);
> > +
> > +       mod_timer(&fifo->timer, jiffies + mlxbf_tmfifo_timer_interval);
> > +}
>=20
> > +       /* Adjust the size to available space. */
> > +       if (size + sizeof(hdr) > avail * sizeof(u64))
> > +               size =3D avail * sizeof(u64) - sizeof(hdr);
>=20
> Can avail be 0?

It won't be 0. There is a check at the beginning of this function.
The function will return is avail is too small.

>=20
> > +       /* Write header. */
> > +       hdr.u.data =3D 0;
> > +       hdr.type =3D VIRTIO_ID_CONSOLE;
> > +       hdr.len =3D htons(size);
> > +       hdr.u.data_le =3D cpu_to_le64(hdr.u.data);
>=20
> > +       writeq(hdr.u.data, fifo->tx_base + MLXBF_TMFIFO_TX_DATA);
>=20
> So, this one is not protected anyhow? Potential race condition?

The spin-lock is to protect reference to the =91tx_buf=92, not the read/wri=
te of the fifo.
The fifo read/write is protected by mutex. Added a comment in v10 to avoid =
such
confusion.
>=20
> > +
> > +       spin_lock_irqsave(&fifo->spin_lock, flags);
> > +
> > +       while (size > 0) {
> > +               addr =3D cons->tx_buf + cons->tx_head;
> > +
> > +               if (cons->tx_head + sizeof(u64) <=3D
> > +                   MLXBF_TMFIFO_CONS_TX_BUF_SIZE) {
> > +                       memcpy(&data, addr, sizeof(u64));
> > +               } else {
> > +                       partial =3D MLXBF_TMFIFO_CONS_TX_BUF_SIZE - con=
s->tx_head;
> > +                       memcpy(&data, addr, partial);
> > +                       memcpy((u8 *)&data + partial, cons->tx_buf,
> > +                              sizeof(u64) - partial);
> > +               }
> > +               writeq(data, fifo->tx_base + MLXBF_TMFIFO_TX_DATA);
> > +
> > +               if (size >=3D sizeof(u64)) {
> > +                       mlxbf_tmfifo_vdev_tx_buf_index_inc(&cons->tx_he=
ad,
> > +                                                          sizeof(u64))=
;
> > +                       size -=3D sizeof(u64);
> > +               } else {
> > +                       mlxbf_tmfifo_vdev_tx_buf_index_inc(&cons->tx_he=
ad,
> > +                                                          size);
> > +                       size =3D 0;
> > +               }
> > +       }
> > +
> > +       spin_unlock_irqrestore(&fifo->spin_lock, flags);
> > +}
>=20
> > +       /* Rx/Tx one word (8 bytes) if not done. */
> > +       if (vring->cur_len !=3D len)
> > +               mlxbf_tmfifo_rxtx_word(fifo, vdev, vring, desc, is_rx, =
avail,
> > +                                      len);
>=20
> In such case better to keep it in one line.

Updated in v10

>=20
> > +/* Get the array of feature bits for this device. */
> > +static u64 mlxbf_tmfifo_virtio_get_features(struct virtio_device *vdev=
)
> > +{
> > +       struct mlxbf_tmfifo_vdev *tm_vdev;
> > +
> > +       tm_vdev =3D container_of(vdev, struct mlxbf_tmfifo_vdev, vdev);
> > +       return tm_vdev->features;
> > +}
> > +
> > +/* Confirm device features to use. */
> > +static int mlxbf_tmfifo_virtio_finalize_features(struct virtio_device =
*vdev)
> > +{
> > +       struct mlxbf_tmfifo_vdev *tm_vdev;
> > +
>=20
> > +       tm_vdev =3D container_of(vdev, struct mlxbf_tmfifo_vdev, vdev);
>=20
> This is candidate to be a macro
>=20
> #define mlxbt_vdev_to_tmfifo(...) ...

Updated in v10

>=20
> > +       tm_vdev->features =3D vdev->features;
> > +
> > +       return 0;
> > +}
>=20
> > +/* Create vdev type in a tmfifo. */
> > +static int mlxbf_tmfifo_create_vdev(struct device *dev,
> > +                                   struct mlxbf_tmfifo *fifo,
> > +                                   int vdev_id, u64 features,
> > +                                   void *config, u32 size)
> > +{
> > +       struct mlxbf_tmfifo_vdev *tm_vdev;
> > +       int ret =3D 0;
> > +
> > +       mutex_lock(&fifo->lock);
> > +
> > +       tm_vdev =3D fifo->vdev[vdev_id];
> > +       if (tm_vdev) {
> > +               dev_err(dev, "vdev %d already exists\n", vdev_id);
> > +               ret =3D -EEXIST;
> > +               goto fail;
> > +       }
> > +
> > +       tm_vdev =3D devm_kzalloc(dev, sizeof(*tm_vdev), GFP_KERNEL);
> > +       if (!tm_vdev) {
> > +               ret =3D -ENOMEM;
> > +               goto fail;
> > +       }
> > +
> > +       tm_vdev->vdev.id.device =3D vdev_id;
> > +       tm_vdev->vdev.config =3D &mlxbf_tmfifo_virtio_config_ops;
> > +       tm_vdev->vdev.dev.parent =3D &fifo->pdev->dev;
> > +       tm_vdev->features =3D features;
> > +       if (config)
> > +               memcpy(&tm_vdev->config, config, size);
> > +       if (mlxbf_tmfifo_alloc_vrings(fifo, tm_vdev, vdev_id)) {
> > +               dev_err(dev, "unable to allocate vring\n");
> > +               ret =3D -ENOMEM;
> > +               goto fail;
> > +       }
> > +       if (vdev_id =3D=3D VIRTIO_ID_CONSOLE)
>=20
> > +               tm_vdev->tx_buf =3D devm_kmalloc(dev,
> > +                                              MLXBF_TMFIFO_CONS_TX_BUF=
_SIZE,
> > +                                              GFP_KERNEL);
>=20
> Are you sure devm_ suits here?

I think it's ok. The tx_buf is normal memory for output buffer.
It's running on SoC and the TmFifo is always there. So it's=20
allocated at init and supposed to be released on module remove.

>=20
> > +       fifo->vdev[vdev_id] =3D tm_vdev;
> > +
> > +       /* Register the virtio device. */
> > +       ret =3D register_virtio_device(&tm_vdev->vdev);
> > +       if (ret) {
> > +               dev_err(&fifo->pdev->dev, "register_virtio_device faile=
d\n");
> > +               goto register_fail;
> > +       }
> > +
> > +       mutex_unlock(&fifo->lock);
> > +       return 0;
> > +
> > +register_fail:
> > +       mlxbf_tmfifo_free_vrings(fifo, vdev_id);
> > +       fifo->vdev[vdev_id] =3D NULL;
> > +fail:
> > +       mutex_unlock(&fifo->lock);
> > +       return ret;
> > +}
>=20
> > +/* Read the configured network MAC address from efi variable. */
> > +static void mlxbf_tmfifo_get_cfg_mac(u8 *mac)
> > +{
> > +       efi_guid_t guid =3D EFI_GLOBAL_VARIABLE_GUID;
> > +       efi_status_t status;
> > +       unsigned long size;
> > +       u8 buf[6];
> > +
> > +       size =3D sizeof(buf);
> > +       status =3D efi.get_variable(mlxbf_tmfifo_efi_name, &guid, NULL,=
 &size,
> > +                                 buf);
> > +       if (status =3D=3D EFI_SUCCESS && size =3D=3D sizeof(buf))
> > +               memcpy(mac, buf, sizeof(buf));
> > +}
>=20
> Shouldn't be rather helper in EFI lib in kernel?

It's a little strange that there seems no such existing lib function. I sea=
rched
a little bit in kernel tree like below, they seem using the efi.get_variabl=
e()
approach.
arch/x86/kernel/ima_arch.c
drivers/scsi/isci/probe_roms.c
security/integrity/platform_certs/load_uefi.c

>=20
> > +/* Probe the TMFIFO. */
> > +static int mlxbf_tmfifo_probe(struct platform_device *pdev)
> > +{
> > +       struct virtio_net_config net_config;
> > +       struct resource *rx_res, *tx_res;
> > +       struct mlxbf_tmfifo *fifo;
> > +       int i, ret;
> > +
> > +       /* Get the resource of the Rx FIFO. */
> > +       rx_res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> > +       if (!rx_res)
> > +               return -ENODEV;
> > +
> > +       /* Get the resource of the Tx FIFO. */
> > +       tx_res =3D platform_get_resource(pdev, IORESOURCE_MEM, 1);
> > +       if (!tx_res)
> > +               return -ENODEV;
> > +
> > +       if (!devm_request_mem_region(&pdev->dev, rx_res->start,
> > +                                    resource_size(rx_res), "bf-tmfifo"=
))
> > +               return -EBUSY;
> > +
> > +       if (!devm_request_mem_region(&pdev->dev, tx_res->start,
> > +                                    resource_size(tx_res), "bf-tmfifo"=
))
> > +               return -EBUSY;
> > +
> > +       fifo =3D devm_kzalloc(&pdev->dev, sizeof(*fifo), GFP_KERNEL);
> > +       if (!fifo)
> > +               return -ENOMEM;
> > +
> > +       fifo->pdev =3D pdev;
> > +       platform_set_drvdata(pdev, fifo);
> > +
> > +       spin_lock_init(&fifo->spin_lock);
> > +       INIT_WORK(&fifo->work, mlxbf_tmfifo_work_handler);
> > +
> > +       timer_setup(&fifo->timer, mlxbf_tmfifo_timer, 0);
> > +
> > +       for (i =3D 0; i < MLXBF_TM_IRQ_CNT; i++) {
> > +               fifo->irq_info[i].index =3D i;
> > +               fifo->irq_info[i].fifo =3D fifo;
>=20
> > +               fifo->irq_info[i].irq =3D platform_get_irq(pdev, i);
>=20
>=20
> > +               ret =3D devm_request_irq(&pdev->dev, fifo->irq_info[i].=
irq,
> > +                                      mlxbf_tmfifo_irq_handler, 0,
> > +                                      "tmfifo", &fifo->irq_info[i]);
> > +               if (ret) {
> > +                       dev_err(&pdev->dev, "devm_request_irq failed\n"=
);
> > +                       fifo->irq_info[i].irq =3D 0;
> > +                       return ret;
> > +               }
> > +       }
> > +
>=20
> > +       fifo->rx_base =3D devm_ioremap(&pdev->dev, rx_res->start,
> > +                                    resource_size(rx_res));
> > +       if (!fifo->rx_base)
> > +               return -ENOMEM;
> > +
> > +       fifo->tx_base =3D devm_ioremap(&pdev->dev, tx_res->start,
> > +                                    resource_size(tx_res));
> > +       if (!fifo->tx_base)
> > +               return -ENOMEM;
>=20
> Switch to devm_ioremap_resource().
> However, I think you probably need memremap().

Updated in v10 to use devm_ioremap_resource().

The map is just for several registers which is not meant to be
cache-able. Probably devm_ioremap_nocache() might make
more sense? I checked arm64/include/asm/io.h, looks like
ioremap/ioremap_nocache/ioremap_wt are defined the same
thing.

>=20
> > +       mutex_init(&fifo->lock);
>=20
> Isn't too late for initializing this one?

It won't cause problem here due to the 'is_ready'
flag, but definitely better to move it ahead. Updated in v10.

>=20
>=20
> > +/* Device remove function. */
> > +static int mlxbf_tmfifo_remove(struct platform_device *pdev)
> > +{
> > +       struct mlxbf_tmfifo *fifo =3D platform_get_drvdata(pdev);
> > +
>=20
> > +       if (fifo)
>=20
> How is it possible to be not true?

Updated in v10. Removed.

>=20
> > +               mlxbf_tmfifo_cleanup(fifo);
> > +
>=20
> > +       platform_set_drvdata(pdev, NULL);
>=20
> Redundant.

Updated in v10. Removed.

>=20
> > +
> > +       return 0;
> > +}
>=20
> > +MODULE_LICENSE("GPL");
>=20
> Is it correct?

Fixed in v10 and updated to MODULE_LICENSE("GPL v2");

>=20
> --
> With Best Regards,
> Andy Shevchenko
