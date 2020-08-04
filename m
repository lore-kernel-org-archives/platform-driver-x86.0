From: Cornelia Huck <cohuck@redhat.com>
Subject: Re: [PATCH v2 18/24] mlxbf-tmfifo: sparse tags for config access
Date: Tue, 4 Aug 2020 16:56:34 +0200
Message-ID: <20200804165634.4df11c6b.cohuck@redhat.com>
References: <20200803205814.540410-1-mst@redhat.com>
 <20200803205814.540410-19-mst@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <virtualization-bounces@lists.linux-foundation.org>
In-Reply-To: <20200803205814.540410-19-mst@redhat.com>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/virtualization>,
 <mailto:virtualization-request@lists.linux-foundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/virtualization/>
List-Post: <mailto:virtualization@lists.linux-foundation.org>
List-Help: <mailto:virtualization-request@lists.linux-foundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/virtualization>,
 <mailto:virtualization-request@lists.linux-foundation.org?subject=subscribe>
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Vadim Pasternak <vadimp@mellanox.com>, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, Darren Hart <dvhart@infradead.org>, virtualization@lists.linux-foundation.org, Andy Shevchenko <andy@infradead.org>
List-Id: platform-driver-x86.vger.kernel.org

On Mon, 3 Aug 2020 17:00:01 -0400
"Michael S. Tsirkin" <mst@redhat.com> wrote:

> mlxbf-tmfifo accesses config space using native types -
> which works for it since the legacy virtio native types.
> 
> This will break if it ever needs to support modern virtio,
> so with new tags previously introduced for virtio net config,
> sparse now warns for this in drivers.
> 
> Since this is a legacy only device, fix it up using
> virtio_legacy_is_little_endian for now.

I'm wondering if the driver should make this more explicit?

No issues with the patch, though.

> 
> No functional changes.
> 
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> ---
>  drivers/platform/mellanox/mlxbf-tmfifo.c | 13 ++++++++++---
>  1 file changed, 10 insertions(+), 3 deletions(-)

Acked-by: Cornelia Huck <cohuck@redhat.com>
