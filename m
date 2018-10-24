From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH V2 4/4] misc/pvpanic : pvpanic: add document for
 pvpanic-mmio DT
Date: Wed, 24 Oct 2018 08:35:31 -0500
Message-ID: <CAL_Jsq+Bj2A8z=_vTr+sz4HGCSC8zN7VQkWL1inJYQ56JSkPNg@mail.gmail.com>
References: <1540401136-78500-1-git-send-email-peng.hao2@zte.com.cn> <1540401136-78500-4-git-send-email-peng.hao2@zte.com.cn>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1540401136-78500-4-git-send-email-peng.hao2@zte.com.cn>
Sender: linux-kernel-owner@vger.kernel.org
To: peng.hao2@zte.com.cn
Cc: Mark Rutland <mark.rutland@arm.com>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andy Shevchenko <andy@infradead.org>, Darren Hart <dvhart@infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, hutao@cn.fujitsu.com
List-Id: platform-driver-x86.vger.kernel.org

Please Cc DT list for bindings.

On Wed, Oct 24, 2018 at 4:01 AM Peng Hao <peng.hao2@zte.com.cn> wrote:
>

Commit message?

"dt-bindings: misc: ..." for the subject.

> Signed-off-by: Peng Hao <peng.hao2@zte.com.cn>
> ---
>  .../devicetree/bindings/arm/pvpanic-mmio.txt       | 29 ++++++++++++++++++++++

As Mark said, not ARM specific. So please move to bindings/misc/ and
use the compatible string for the name (qemu,pvpanic-mmio.txt).

>  1 file changed, 29 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/arm/pvpanic-mmio.txt
>
> diff --git a/Documentation/devicetree/bindings/arm/pvpanic-mmio.txt b/Documentation/devicetree/bindings/arm/pvpanic-mmio.txt
> new file mode 100644
> index 0000000..a6bdacd
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/pvpanic-mmio.txt
> @@ -0,0 +1,29 @@
> +* QEMU PVPANIC MMIO Configuration bindings for ARM

Drop the "for ARM"

> +
> +QEMU's emulation / virtualization targets provide the following PVPANIC
> +MMIO Configuration interface on the "virt" machine.
> +type:
> +
> +- a read-write, 16-bit wide data register.
> +
> +QEMU exposes the data register to guests as memory mapped registers.

I have to wonder why we need a QEMU specific way to signal a panic.
What about every real platform that panics? What are they supposed to
do? Shouldn't this be a PSCI call so we can have something not per
platform?

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
