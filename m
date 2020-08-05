From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v3 18/38] mlxbf-tmfifo: sparse tags for config access
Date: Wed, 5 Aug 2020 17:24:53 +0300
Message-ID: <CAHp75Vfyjxegi8EtNqVZLVUDzR_0WOJQVmJFoJi4DFxDgNRG-g@mail.gmail.com>
References: <20200805134226.1106164-1-mst@redhat.com> <20200805134226.1106164-19-mst@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200805134226.1106164-19-mst@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Cornelia Huck <cohuck@redhat.com>, Andy Shevchenko <andy@infradead.org>, Darren Hart <dvhart@infradead.org>, Vadim Pasternak <vadimp@mellanox.com>, Platform Driver <platform-driver-x86@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Wed, Aug 5, 2020 at 4:44 PM Michael S. Tsirkin <mst@redhat.com> wrote:
>
> mlxbf-tmfifo accesses config space using native types -
> which works for it since the legacy virtio native types.
>
> This will break if it ever needs to support modern virtio,
> so with new tags previously introduced for virtio net config,
> sparse now warns for this in drivers.
>
> Since this is a legacy only device, fix it up using
> virtio_legacy_is_little_endian for now.
>
> No functional changes.
>

Acked-by: Andy Shevchenko <andy.shevchenko@gmail.com>

> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> Acked-by: Cornelia Huck <cohuck@redhat.com>
> ---
>  drivers/platform/mellanox/mlxbf-tmfifo.c | 13 ++++++++++---
>  1 file changed, 10 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/platform/mellanox/mlxbf-tmfifo.c b/drivers/platform/mellanox/mlxbf-tmfifo.c
> index 5739a9669b29..bbc4e71a16ff 100644
> --- a/drivers/platform/mellanox/mlxbf-tmfifo.c
> +++ b/drivers/platform/mellanox/mlxbf-tmfifo.c
> @@ -625,7 +625,10 @@ static void mlxbf_tmfifo_rxtx_header(struct mlxbf_tmfifo_vring *vring,
>                         vdev_id = VIRTIO_ID_NET;
>                         hdr_len = sizeof(struct virtio_net_hdr);
>                         config = &fifo->vdev[vdev_id]->config.net;
> -                       if (ntohs(hdr.len) > config->mtu +
> +                       /* A legacy-only interface for now. */
> +                       if (ntohs(hdr.len) >
> +                           __virtio16_to_cpu(virtio_legacy_is_little_endian(),
> +                                             config->mtu) +
>                             MLXBF_TMFIFO_NET_L2_OVERHEAD)
>                                 return;
>                 } else {
> @@ -1231,8 +1234,12 @@ static int mlxbf_tmfifo_probe(struct platform_device *pdev)
>
>         /* Create the network vdev. */
>         memset(&net_config, 0, sizeof(net_config));
> -       net_config.mtu = ETH_DATA_LEN;
> -       net_config.status = VIRTIO_NET_S_LINK_UP;
> +
> +       /* A legacy-only interface for now. */
> +       net_config.mtu = __cpu_to_virtio16(virtio_legacy_is_little_endian(),
> +                                          ETH_DATA_LEN);
> +       net_config.status = __cpu_to_virtio16(virtio_legacy_is_little_endian(),
> +                                             VIRTIO_NET_S_LINK_UP);
>         mlxbf_tmfifo_get_cfg_mac(net_config.mac);
>         rc = mlxbf_tmfifo_create_vdev(dev, fifo, VIRTIO_ID_NET,
>                                       MLXBF_TMFIFO_NET_FEATURES, &net_config,
> --
> MST
>


-- 
With Best Regards,
Andy Shevchenko
