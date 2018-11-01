From: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH V5 8/8]  dt-bindings/misc/pvpanic :add document for
 pvpanic-mmio
Date: Thu, 1 Nov 2018 11:46:06 +0000
Message-ID: <20181101114606.ehiis3adjchjvr34@lakrids.cambridge.arm.com>
References: <1541085002-42993-1-git-send-email-peng.hao2@zte.com.cn>
 <1541085002-42993-8-git-send-email-peng.hao2@zte.com.cn>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1541085002-42993-8-git-send-email-peng.hao2@zte.com.cn>
Sender: linux-kernel-owner@vger.kernel.org
To: Peng Hao <peng.hao2@zte.com.cn>
Cc: robh+dt@kernel.org, arnd@arndb.de, gregkh@linuxfoundation.org, andy@infradead.org, dvhart@infradead.org, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, hutao@cn.fujitsu.com, linux-doc@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Please fix the spacing in the commit title. It should be formatted:

  dt-bindings: misc/pvpanic: add document for pvpanic-mmio

On Thu, Nov 01, 2018 at 11:10:02PM +0800, Peng Hao wrote:
> Add dt-bindings document for "qemu:pvpanic-mmio".
> 
> Signed-off-by: Peng Hao <peng.hao2@zte.com.cn>

With the title fixed:

Acked-by: Mark Rutland <mark.rutland@arm.com>

When sending DT bindings in future, please follow the process in:

  Documentation/devicetree/bindings/submitting-patches.txt

... e.g., send the binding before the code using the binding.

Thanks,
Mark.

> ---
>  .../devicetree/bindings/misc/pvpanic-mmio.txt      | 29 ++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/misc/pvpanic-mmio.txt
> 
> diff --git a/Documentation/devicetree/bindings/misc/pvpanic-mmio.txt b/Documentation/devicetree/bindings/misc/pvpanic-mmio.txt
> new file mode 100644
> index 0000000..985e907
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/misc/pvpanic-mmio.txt
> @@ -0,0 +1,29 @@
> +* QEMU PVPANIC MMIO Configuration bindings
> +
> +QEMU's emulation / virtualization targets provide the following PVPANIC
> +MMIO Configuration interface on the "virt" machine.
> +type:
> +
> +- a read-write, 16-bit wide data register.
> +
> +QEMU exposes the data register to guests as memory mapped registers.
> +
> +Required properties:
> +
> +- compatible: "qemu,pvpanic-mmio".
> +- reg: the MMIO region used by the device.
> +  * Bytes 0x0  Write panic event to the reg when guest OS panics.
> +  * Bytes 0x1  Reserved.
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
