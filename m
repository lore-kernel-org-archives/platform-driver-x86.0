From: "Michael S. Tsirkin" <mst@redhat.com>
Subject: [PATCH v2] mlxbf-tmfifo: use wrappers for config access
Date: Tue, 14 Jul 2020 05:15:32 -0400
Message-ID: <20200714091133.788853-1-mst@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Andy Shevchenko <andy@infradead.org>, Darren Hart <dvhart@infradead.org>, Vadim Pasternak <vadimp@mellanox.com>, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

mlxbf-tmfifo.c

seems to access virtio net config directly.
E.g.:

                        if (ntohs(hdr.len) > config->mtu +
                            MLXBF_TMFIFO_NET_L2_OVERHEAD)
                                return;

This is not incorrect in that the specific device is at the
moment always legacy (no virtio 1).

However this throws up sparse warnings as the structure
is shared with modern devices which need the tagging for
correct virtio 1 endian-ness.

Using correct conversions will also allow virtio 1 support
in this driver down the road.

I'd like to merge the following patch. It's on top of
a branch config-endian in my tree which includes
the endian-ness tagging.

Would appreciate acks on merging it through my tree from relevant maintainers.
I also note that the console config field seems to be unused.
Would appreciate a confirmation.
Thanks!

---

Changes from v1:
	bugfixes

 drivers/platform/mellanox/mlxbf-tmfifo.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/mellanox/mlxbf-tmfifo.c b/drivers/platform/mellanox/mlxbf-tmfifo.c
index 5739a9669b29..3a93081eee97 100644
--- a/drivers/platform/mellanox/mlxbf-tmfifo.c
+++ b/drivers/platform/mellanox/mlxbf-tmfifo.c
@@ -608,6 +608,7 @@ static void mlxbf_tmfifo_rxtx_header(struct mlxbf_tmfifo_vring *vring,
 {
 	struct mlxbf_tmfifo *fifo = vring->fifo;
 	struct virtio_net_config *config;
+	struct virtio_device *vdev;
 	struct mlxbf_tmfifo_msg_hdr hdr;
 	int vdev_id, hdr_len;
 
@@ -625,7 +626,8 @@ static void mlxbf_tmfifo_rxtx_header(struct mlxbf_tmfifo_vring *vring,
 			vdev_id = VIRTIO_ID_NET;
 			hdr_len = sizeof(struct virtio_net_hdr);
 			config = &fifo->vdev[vdev_id]->config.net;
-			if (ntohs(hdr.len) > config->mtu +
+			vdev = &fifo->vdev[vdev_id]->vdev;
+			if (ntohs(hdr.len) > virtio16_to_cpu(vdev, config->mtu) +
 			    MLXBF_TMFIFO_NET_L2_OVERHEAD)
 				return;
 		} else {
@@ -1231,8 +1233,14 @@ static int mlxbf_tmfifo_probe(struct platform_device *pdev)
 
 	/* Create the network vdev. */
 	memset(&net_config, 0, sizeof(net_config));
-	net_config.mtu = ETH_DATA_LEN;
-	net_config.status = VIRTIO_NET_S_LINK_UP;
+
+#define MLXBF_TMFIFO_LITTLE_ENDIAN (virtio_legacy_is_little_endian() || \
+			(MLXBF_TMFIFO_NET_FEATURES & (1ULL << VIRTIO_F_VERSION_1)))
+
+	net_config.mtu = __cpu_to_virtio16(MLXBF_TMFIFO_LITTLE_ENDIAN,
+					   ETH_DATA_LEN);
+	net_config.status = __cpu_to_virtio16(MLXBF_TMFIFO_LITTLE_ENDIAN,
+					      VIRTIO_NET_S_LINK_UP);
 	mlxbf_tmfifo_get_cfg_mac(net_config.mac);
 	rc = mlxbf_tmfifo_create_vdev(dev, fifo, VIRTIO_ID_NET,
 				      MLXBF_TMFIFO_NET_FEATURES, &net_config,
-- 
MST
