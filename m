From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v5 2/2] platform/mellanox/mlxbf-bootctl: Add the ABI
 definitions
Date: Fri, 17 May 2019 19:59:26 +0200
Message-ID: <20190517175926.GA24535@kroah.com>
References: <0b74e9ad12360b56bc0a3c2ca972798c424f2610.1548790896.git.lsun@mellanox.com>
 <1558115345-32476-2-git-send-email-lsun@mellanox.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1558115345-32476-2-git-send-email-lsun@mellanox.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Liming Sun <lsun@mellanox.com>
Cc: Andy Shevchenko <andy@infradead.org>, Darren Hart <dvhart@infradead.org>, Vadim Pasternak <vadimp@mellanox.com>, David Woods <dwoods@mellanox.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, Jonathan Cameron <Jonathan.Cameron@huawei.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, "Paul E. McKenney" <paulmck@linux.ibm.com>
List-Id: platform-driver-x86.vger.kernel.org

On Fri, May 17, 2019 at 01:49:05PM -0400, Liming Sun wrote:
> This commit adds the ABI definitions exposed to userspace for
> the platform/mellanox/mlxbf-bootctl driver.
> 
> Reviewed-by: Vadim Pasternak <vadimp@mellanox.com>
> Signed-off-by: Liming Sun <lsun@mellanox.com>
> ---
>  .../ABI/testing/sysfs-platform-mellanox-bootctl    | 58 ++++++++++++++++++++++
>  MAINTAINERS                                        |  1 +
>  2 files changed, 59 insertions(+)
>  create mode 100644 Documentation/ABI/testing/sysfs-platform-mellanox-bootctl
> 
> diff --git a/Documentation/ABI/testing/sysfs-platform-mellanox-bootctl b/Documentation/ABI/testing/sysfs-platform-mellanox-bootctl
> new file mode 100644
> index 0000000..19a14db
> --- /dev/null
> +++ b/Documentation/ABI/testing/sysfs-platform-mellanox-bootctl
> @@ -0,0 +1,58 @@
> +What:		/sys/bus/platform/drivers/mlxbf-bootctl/lifecycle_state
> +Date:		May 2019
> +KernelVersion:	5.3
> +Contact:	"Liming Sun <lsun@mellanox.com>"
> +Description:
> +		The Life-cycle state of the SoC, which could be one of the
> +		following values.
> +		  Production - Production state and can be updated to secure
> +		  GA Secured - Secure chip and not able to change state
> +		  GA Non-Secured - Non-Secure chip and not able to change state
> +		  RMA - Return Merchandise Authorization

A "driver" does not have a lifecycle state, a "device" does.

You are putting all of these attributes in the wrong place.  Put them on
your device please, not the driver.  driver-specific attributes are
_VERY_ rare, and only for things that can modify/show for all devices
attached to that driver.

thanks,

greg k-h
