From: "Michael S. Tsirkin" <mst@redhat.com>
Subject: [PATCH v2 18/24] mlxbf-tmfifo: sparse tags for config access
Date: Mon, 3 Aug 2020 17:00:01 -0400
Message-ID: <20200803205814.540410-19-mst@redhat.com>
References: <20200803205814.540410-1-mst@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <virtualization-bounces@lists.linux-foundation.org>
In-Reply-To: <20200803205814.540410-1-mst@redhat.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/virtualization>,
 <mailto:virtualization-request@lists.linux-foundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/virtualization/>
List-Post: <mailto:virtualization@lists.linux-foundation.org>
List-Help: <mailto:virtualization-request@lists.linux-foundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/virtualization>,
 <mailto:virtualization-request@lists.linux-foundation.org?subject=subscribe>
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>
To: linux-kernel@vger.kernel.org
Cc: Vadim Pasternak <vadimp@mellanox.com>, platform-driver-x86@vger.kernel.org, Darren Hart <dvhart@infradead.org>, virtualization@lists.linux-foundation.org, Andy Shevchenko <andy@infradead.org>
List-Id: platform-driver-x86.vger.kernel.org

mlxbf-tmfifo accesses config space using native types -
which works for it since the legacy virtio native types.

This will break if it ever needs to support modern virtio,
so with new tags previously introduced for virtio net config,
sparse now warns for this in drivers.

Since this is a legacy only device, fix it up using
virtio_legacy_is_little_endian for now.

No functional changes.

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 drivers/platform/mellanox/mlxbf-tmfifo.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/mellanox/mlxbf-tmfifo.c b/drivers/platform/mellanox/mlxbf-tmfifo.c
index 5739a9669b29..bbc4e71a16ff 100644
--- a/drivers/platform/mellanox/mlxbf-tmfifo.c
+++ b/drivers/platform/mellanox/mlxbf-tmfifo.c
@@ -625,7 +625,10 @@ static void mlxbf_tmfifo_rxtx_header(struct mlxbf_tmfifo_vring *vring,
 			vdev_id = VIRTIO_ID_NET;
 			hdr_len = sizeof(struct virtio_net_hdr);
 			config = &fifo->vdev[vdev_id]->config.net;
-			if (ntohs(hdr.len) > config->mtu +
+			/* A legacy-only interface for now. */
+			if (ntohs(hdr.len) >
+			    __virtio16_to_cpu(virtio_legacy_is_little_endian(),
+					      config->mtu) +
 			    MLXBF_TMFIFO_NET_L2_OVERHEAD)
 				return;
 		} else {
@@ -1231,8 +1234,12 @@ static int mlxbf_tmfifo_probe(struct platform_device *pdev)
 
 	/* Create the network vdev. */
 	memset(&net_config, 0, sizeof(net_config));
-	net_config.mtu = ETH_DATA_LEN;
-	net_config.status = VIRTIO_NET_S_LINK_UP;
+
+	/* A legacy-only interface for now. */
+	net_config.mtu = __cpu_to_virtio16(virtio_legacy_is_little_endian(),
+					   ETH_DATA_LEN);
+	net_config.status = __cpu_to_virtio16(virtio_legacy_is_little_endian(),
+					      VIRTIO_NET_S_LINK_UP);
 	mlxbf_tmfifo_get_cfg_mac(net_config.mac);
 	rc = mlxbf_tmfifo_create_vdev(dev, fifo, VIRTIO_ID_NET,
 				      MLXBF_TMFIFO_NET_FEATURES, &net_config,
-- 
MST
