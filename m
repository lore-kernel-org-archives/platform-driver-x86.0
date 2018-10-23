From: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH 4/4]  pvpanic: add document for pvpanic-mmio DT
Date: Tue, 23 Oct 2018 11:41:38 +0100
Message-ID: <20181023104138.5yqjgul7mrpodjhe@lakrids.cambridge.arm.com>
References: <1540315537-70007-1-git-send-email-peng.hao2@zte.com.cn>
 <1540315537-70007-4-git-send-email-peng.hao2@zte.com.cn>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1540315537-70007-4-git-send-email-peng.hao2@zte.com.cn>
Sender: linux-kernel-owner@vger.kernel.org
To: Peng Hao <peng.hao2@zte.com.cn>
Cc: robh+dt@kernel.org, arnd@arndb.de, gregkh@linuxfoundation.org, andy@infradead.org, dvhart@infradead.org, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, hutao@cn.fujitsu.com
List-Id: platform-driver-x86.vger.kernel.org

On Wed, Oct 24, 2018 at 01:25:37AM +0800, Peng Hao wrote:
> Signed-off-by: Peng Hao <peng.hao2@zte.com.cn>
> ---
>  .../devicetree/bindings/arm/pvpanic-mmio.txt       | 26 ++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/arm/pvpanic-mmio.txt
> 
> diff --git a/Documentation/devicetree/bindings/arm/pvpanic-mmio.txt b/Documentation/devicetree/bindings/arm/pvpanic-mmio.txt
> new file mode 100644
> index 0000000..96c84e15
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/pvpanic-mmio.txt
> @@ -0,0 +1,26 @@
> +* QEMU PVPANIC MMIO Configuration bindings for ARM
> +
> +QEMU's aarch64-softmmu emulation / virtualization targets provide the
> +following PVPANIC MMIO Configuration interface on the "virt" machine
> +type:
> +
> +- a read-write, 16-bit wide data register.
> +
> +QEMU exposes the data register to ARM guests as memory mapped registers.

Please drop references to arm/arm64 in the commit message. I'm sure
other architectures will pick this up, and we only need to describe that
it's an MMIO device that QEMU can provide.

> +
> +Required properties:
> +
> +- compatible: "qemu,pvpanic-mmio".

The reg property should also be described.

Otherwise, this looks good to me.

Thanks,
Mark.

> +
> +Example:
> +
> +/ {
> +        #size-cells = <0x2>;
> +        #address-cells = <0x2>;
> +
> +        pvpanic-mmio@9060000 {
> +                compatible = "qemu,pvpanic-mmio";
> +                reg = <0x0 0x9060000 0x0 0x2>;
> +        };
> +};
> +
> -- 
> 1.8.3.1
> 
