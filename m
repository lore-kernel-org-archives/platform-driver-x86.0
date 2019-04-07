From: Liming Sun <lsun@mellanox.com>
Subject: Re: [PATCH v13] platform/mellanox: Add TmFifo driver for Mellanox
 BlueField Soc
Date: Sun, 7 Apr 2019 02:05:10 +0000
Message-ID: <DB6PR05MB3223F6EA9E91F2564C24F5D5A1530@DB6PR05MB3223.eurprd05.prod.outlook.com>
References: <b143b40446c1870fb8d422b364ead95d54552be9.1527264077.git.lsun@mellanox.com>
 <1554406595-3128-1-git-send-email-lsun@mellanox.com>
 <CAHp75VdUwn1NEpSc0_Oc4wEh0TRzCwcE0_tajg3ak8BjfZ_-Mw@mail.gmail.com>,<DB6PR05MB3223779DDDF815D2F5AFFE6BA1510@DB6PR05MB3223.eurprd05.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <DB6PR05MB3223779DDDF815D2F5AFFE6BA1510@DB6PR05MB3223.eurprd05.prod.outlook.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: David Woods <dwoods@mellanox.com>, Andy Shevchenko <andy@infradead.org>, Darren Hart <dvhart@infradead.org>, Vadim Pasternak <vadimp@mellanox.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

Thanks Andy!  I just posted v14, which addresses all the comments you menti=
oned below for v13.=0A=
=0A=
Regards,=0A=
Liming=0A=
=0A=
> -----Original Message-----=0A=
> From: Andy Shevchenko <andy.shevchenko@gmail.com>=0A=
> Sent: Friday, April 5, 2019 11:44 AM=0A=
> To: Liming Sun <lsun@mellanox.com>=0A=
> Cc: David Woods <dwoods@mellanox.com>; Andy Shevchenko <andy@infradead.or=
g>; Darren Hart <dvhart@infradead.org>; Vadim=0A=
> Pasternak <vadimp@mellanox.com>; Linux Kernel Mailing List <linux-kernel@=
vger.kernel.org>; Platform Driver <platform-driver-=0A=
> x86@vger.kernel.org>=0A=
> Subject: Re: [PATCH v13] platform/mellanox: Add TmFifo driver for Mellano=
x BlueField Soc=0A=
>=0A=
> On Thu, Apr 4, 2019 at 10:36 PM Liming Sun <lsun@mellanox.com> wrote:=0A=
> > This commit adds the TmFifo platform driver for Mellanox BlueField=0A=
> > Soc. TmFifo is a shared FIFO which enables external host machine=0A=
> > to exchange data with the SoC via USB or PCIe. The driver is based=0A=
> > on virtio framework and has console and network access enabled.=0A=
>=0A=
> Thanks for an update. Almost good.=0A=
> My comments below.=0A=
>=0A=
> Meanwhile I pushed this to my review and testing queue, thanks!=0A=
>=0A=
> > +#include <linux/acpi.h>=0A=
> > +#include <linux/bitfield.h>=0A=
> > +#include <linux/circ_buf.h>=0A=
> > +#include <linux/efi.h>=0A=
> > +#include <linux/irq.h>=0A=
> > +#include <linux/module.h>=0A=
> > +#include <linux/mutex.h>=0A=
> > +#include <linux/platform_device.h>=0A=
> > +#include <linux/types.h>=0A=
>=0A=
> Perhaps blank line here. Would be more clear that this is utilizing=0A=
> virtio framework.=0A=
=0A=
Updated in v14.=0A=
=0A=
>=0A=
> > +#include <linux/virtio_config.h>=0A=
> > +#include <linux/virtio_console.h>=0A=
> > +#include <linux/virtio_ids.h>=0A=
> > +#include <linux/virtio_net.h>=0A=
> > +#include <linux/virtio_ring.h>=0A=
>=0A=
> > +/**=0A=
> > + * mlxbf_tmfifo_msg_hdr - Structure of the TmFifo message header=0A=
> > + * @type: message type=0A=
> > + * @len: payload length=0A=
> > + * @u: 64-bit union data=0A=
> > + */=0A=
> > +union mlxbf_tmfifo_msg_hdr {=0A=
> > +       struct {=0A=
> > +               u8 type;=0A=
> > +               __be16 len;=0A=
> > +               u8 unused[5];=0A=
> > +       } __packed;=0A=
> > +       u64 data;=0A=
>=0A=
> I'm not sure I understand how you can distinguish which field of union to=
 use?=0A=
> Isn't here some type missed?=0A=
=0A=
Updated the comment in v14.=0A=
=0A=
This message header is a union of struct and u64 data.=0A=
The 'struct' has=0A=
type and length field which are used to encode & decode the message. =0A=
The 'data' field is used to read/write the message header from/to the FIFO.=
=0A=
=0A=
>=0A=
> > +};=0A=
>=0A=
> > +static u8 mlxbf_tmfifo_net_default_mac[ETH_ALEN] =3D {=0A=
>=0A=
> > +       0x00, 0x1A, 0xCA, 0xFF, 0xFF, 0x01};=0A=
>=0A=
> This should be two lines.=0A=
=0A=
Updated in v14.=0A=
=0A=
>=0A=
> > +/* Supported virtio-net features. */=0A=
> > +#define MLXBF_TMFIFO_NET_FEATURES      (BIT_ULL(VIRTIO_NET_F_MTU) | \=
=0A=
> > +                                        BIT_ULL(VIRTIO_NET_F_STATUS) |=
 \=0A=
> > +                                        BIT_ULL(VIRTIO_NET_F_MAC))=0A=
>=0A=
> Better to write as=0A=
>=0A=
> #define FOO \=0A=
> (BIT(x) | BIT(y) ...)=0A=
>=0A=
> I think I told this earlier?=0A=
=0A=
Updated in v14.=0A=
=0A=
>=0A=
> > +/* Allocate vrings for the fifo. */=0A=
>=0A=
> fifo -> FIFO (and check all occurrences)=0A=
=0A=
Updated in v14.=0A=
=0A=
>=0A=
> > +static int mlxbf_tmfifo_alloc_vrings(struct mlxbf_tmfifo *fifo,=0A=
> > +                                    struct mlxbf_tmfifo_vdev *tm_vdev)=
=0A=
> > +{=0A=
> > +       struct mlxbf_tmfifo_vring *vring;=0A=
> > +       struct device *dev;=0A=
> > +       dma_addr_t dma;=0A=
> > +       int i, size;=0A=
> > +       void *va;=0A=
> > +=0A=
> > +       for (i =3D 0; i < ARRAY_SIZE(tm_vdev->vrings); i++) {=0A=
> > +               vring =3D &tm_vdev->vrings[i];=0A=
> > +               vring->fifo =3D fifo;=0A=
> > +               vring->num =3D MLXBF_TMFIFO_VRING_SIZE;=0A=
> > +               vring->align =3D SMP_CACHE_BYTES;=0A=
> > +               vring->index =3D i;=0A=
> > +               vring->vdev_id =3D tm_vdev->vdev.id.device;=0A=
> > +               dev =3D &tm_vdev->vdev.dev;=0A=
> > +=0A=
> > +               size =3D vring_size(vring->num, vring->align);=0A=
> > +               va =3D dma_alloc_coherent(dev->parent, size, &dma, GFP_=
KERNEL);=0A=
> > +               if (!va) {=0A=
>=0A=
> > +                       dev_err(dev->parent, "dma_alloc_coherent failed=
\n");=0A=
>=0A=
> I don't see how this will free the allocated entries.=0A=
> I think I told about this either.=0A=
=0A=
Updated in v14.=0A=
It's not a memory leak since the caller will release them=0A=
in case of failures. I added one line in this function to=0A=
call the mlxbf_tmfifo_free_vrings() to be more clear.=0A=
=0A=
>=0A=
> > +                       return -ENOMEM;=0A=
> > +               }=0A=
> > +=0A=
> > +               vring->va =3D va;=0A=
> > +               vring->dma =3D dma;=0A=
> > +       }=0A=
> > +=0A=
> > +       return 0;=0A=
> > +}=0A=
>=0A=
> > +/* House-keeping timer. */=0A=
> > +static void mlxbf_tmfifo_timer(struct timer_list *arg)=0A=
> > +{=0A=
>=0A=
> > +       struct mlxbf_tmfifo *fifo =3D container_of(arg, struct mlxbf_tm=
fifo,=0A=
> > +                                                timer);=0A=
>=0A=
> One line would be still good enough.=0A=
=0A=
Updated in v14.=0A=
=0A=
>=0A=
> > +       int more;=0A=
> > +=0A=
> > +       more =3D !test_and_set_bit(MLXBF_TM_RX_HWM_IRQ, &fifo->pend_eve=
nts) ||=0A=
> > +                   !test_and_set_bit(MLXBF_TM_TX_LWM_IRQ, &fifo->pend_=
events);=0A=
> > +=0A=
> > +       if (more)=0A=
> > +               schedule_work(&fifo->work);=0A=
> > +=0A=
> > +       mod_timer(&fifo->timer, jiffies + MLXBF_TMFIFO_TIMER_INTERVAL);=
=0A=
> > +}=0A=
>=0A=
> > +       status =3D efi.get_variable(mlxbf_tmfifo_efi_name, &guid, NULL,=
 &size,=0A=
> > +                                 buf);=0A=
> > +       if (status =3D=3D EFI_SUCCESS && size =3D=3D ETH_ALEN)=0A=
> > +               ether_addr_copy(mac, buf);=0A=
> > +       else=0A=
>=0A=
> > +               memcpy(mac, mlxbf_tmfifo_net_default_mac, ETH_ALEN);=0A=
>=0A=
> ether_addr_copy() as well.=0A=
=0A=
Updated in v14.=0A=
=0A=
>=0A=
> > +}=0A=
>=0A=
> > +       fifo->pdev =3D pdev;=0A=
>=0A=
> Do you really need to keep pdev there? Isn't struct device pointer enough=
?=0A=
=0A=
Not needed. Updated in v14. Thanks!=0A=
=0A=
>=0A=
>=0A=
> > +       /* Create the console vdev. */=0A=
> > +       ret =3D mlxbf_tmfifo_create_vdev(&pdev->dev, fifo, VIRTIO_ID_CO=
NSOLE, 0,=0A=
> > +                                      NULL, 0);=0A=
>=0A=
> If you define temporary variable=0A=
>   struct device *dev =3D &pdev->dev;=0A=
> these lines can be merged into one.=0A=
=0A=
Yes, updated in v14.=0A=
=0A=
>=0A=
> > +       if (ret)=0A=
> > +               goto fail;=0A=
>=0A=
> --=0A=
> With Best Regards,=0A=
> Andy Shevchenko=0A=
