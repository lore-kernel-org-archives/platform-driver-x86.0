From: Andrew Donnellan <ajd@linux.ibm.com>
Subject: Re: [PATCH v2 06/22] docs: mark orphan documents as such
Date: Wed, 5 Jun 2019 16:16:55 +1000
Message-ID: <65ffdb35-1179-be57-6258-991a02a67a66@linux.ibm.com>
References: <cover.1559656538.git.mchehab+samsung@kernel.org>
 <4afa83787acec906c383978dc01f286940e28616.1559656538.git.mchehab+samsung@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <4afa83787acec906c383978dc01f286940e28616.1559656538.git.mchehab+samsung@kernel.org>
Content-Language: en-AU
Sender: linux-kernel-owner@vger.kernel.org
To: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@infradead.org>, linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, Frederic Barrat <fbarrat@linux.ibm.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <maxime.ripard@bootlin.com>, Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Georgi Djakov <georgi.djakov@linaro.org>, Matan Ziv-Av <matan@svgalib.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, dri-devel@list
List-Id: platform-driver-x86.vger.kernel.org

On 5/6/19 12:17 am, Mauro Carvalho Chehab wrote:
> Sphinx doesn't like orphan documents:
> 
>      Documentation/accelerators/ocxl.rst: WARNING: document isn't included in any toctree
>      Documentation/arm/stm32/overview.rst: WARNING: document isn't included in any toctree
>      Documentation/arm/stm32/stm32f429-overview.rst: WARNING: document isn't included in any toctree
>      Documentation/arm/stm32/stm32f746-overview.rst: WARNING: document isn't included in any toctree
>      Documentation/arm/stm32/stm32f769-overview.rst: WARNING: document isn't included in any toctree
>      Documentation/arm/stm32/stm32h743-overview.rst: WARNING: document isn't included in any toctree
>      Documentation/arm/stm32/stm32mp157-overview.rst: WARNING: document isn't included in any toctree
>      Documentation/gpu/msm-crash-dump.rst: WARNING: document isn't included in any toctree
>      Documentation/interconnect/interconnect.rst: WARNING: document isn't included in any toctree
>      Documentation/laptops/lg-laptop.rst: WARNING: document isn't included in any toctree
>      Documentation/powerpc/isa-versions.rst: WARNING: document isn't included in any toctree
>      Documentation/virtual/kvm/amd-memory-encryption.rst: WARNING: document isn't included in any toctree
>      Documentation/virtual/kvm/vcpu-requests.rst: WARNING: document isn't included in any toctree
> 
> So, while they aren't on any toctree, add :orphan: to them, in order
> to silent this warning.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>

ocxl:

Acked-by: Andrew Donnellan <ajd@linux.ibm.com>

We should find somewhere to put it...

> ---
>   Documentation/accelerators/ocxl.rst             | 2 ++
>   Documentation/arm/stm32/overview.rst            | 2 ++
>   Documentation/arm/stm32/stm32f429-overview.rst  | 2 ++
>   Documentation/arm/stm32/stm32f746-overview.rst  | 2 ++
>   Documentation/arm/stm32/stm32f769-overview.rst  | 2 ++
>   Documentation/arm/stm32/stm32h743-overview.rst  | 2 ++
>   Documentation/arm/stm32/stm32mp157-overview.rst | 2 ++
>   Documentation/gpu/msm-crash-dump.rst            | 2 ++
>   Documentation/interconnect/interconnect.rst     | 2 ++
>   Documentation/laptops/lg-laptop.rst             | 2 ++
>   Documentation/powerpc/isa-versions.rst          | 2 ++
>   11 files changed, 22 insertions(+)
> 
> diff --git a/Documentation/accelerators/ocxl.rst b/Documentation/accelerators/ocxl.rst
> index 14cefc020e2d..b1cea19a90f5 100644
> --- a/Documentation/accelerators/ocxl.rst
> +++ b/Documentation/accelerators/ocxl.rst
> @@ -1,3 +1,5 @@
> +:orphan:
> +
>   ========================================================
>   OpenCAPI (Open Coherent Accelerator Processor Interface)
>   ========================================================
> diff --git a/Documentation/arm/stm32/overview.rst b/Documentation/arm/stm32/overview.rst
> index 85cfc8410798..f7e734153860 100644
> --- a/Documentation/arm/stm32/overview.rst
> +++ b/Documentation/arm/stm32/overview.rst
> @@ -1,3 +1,5 @@
> +:orphan:
> +
>   ========================
>   STM32 ARM Linux Overview
>   ========================
> diff --git a/Documentation/arm/stm32/stm32f429-overview.rst b/Documentation/arm/stm32/stm32f429-overview.rst
> index 18feda97f483..65bbb1c3b423 100644
> --- a/Documentation/arm/stm32/stm32f429-overview.rst
> +++ b/Documentation/arm/stm32/stm32f429-overview.rst
> @@ -1,3 +1,5 @@
> +:orphan:
> +
>   STM32F429 Overview
>   ==================
>   
> diff --git a/Documentation/arm/stm32/stm32f746-overview.rst b/Documentation/arm/stm32/stm32f746-overview.rst
> index b5f4b6ce7656..42d593085015 100644
> --- a/Documentation/arm/stm32/stm32f746-overview.rst
> +++ b/Documentation/arm/stm32/stm32f746-overview.rst
> @@ -1,3 +1,5 @@
> +:orphan:
> +
>   STM32F746 Overview
>   ==================
>   
> diff --git a/Documentation/arm/stm32/stm32f769-overview.rst b/Documentation/arm/stm32/stm32f769-overview.rst
> index 228656ced2fe..f6adac862b17 100644
> --- a/Documentation/arm/stm32/stm32f769-overview.rst
> +++ b/Documentation/arm/stm32/stm32f769-overview.rst
> @@ -1,3 +1,5 @@
> +:orphan:
> +
>   STM32F769 Overview
>   ==================
>   
> diff --git a/Documentation/arm/stm32/stm32h743-overview.rst b/Documentation/arm/stm32/stm32h743-overview.rst
> index 3458dc00095d..c525835e7473 100644
> --- a/Documentation/arm/stm32/stm32h743-overview.rst
> +++ b/Documentation/arm/stm32/stm32h743-overview.rst
> @@ -1,3 +1,5 @@
> +:orphan:
> +
>   STM32H743 Overview
>   ==================
>   
> diff --git a/Documentation/arm/stm32/stm32mp157-overview.rst b/Documentation/arm/stm32/stm32mp157-overview.rst
> index 62e176d47ca7..2c52cd020601 100644
> --- a/Documentation/arm/stm32/stm32mp157-overview.rst
> +++ b/Documentation/arm/stm32/stm32mp157-overview.rst
> @@ -1,3 +1,5 @@
> +:orphan:
> +
>   STM32MP157 Overview
>   ===================
>   
> diff --git a/Documentation/gpu/msm-crash-dump.rst b/Documentation/gpu/msm-crash-dump.rst
> index 757cd257e0d8..240ef200f76c 100644
> --- a/Documentation/gpu/msm-crash-dump.rst
> +++ b/Documentation/gpu/msm-crash-dump.rst
> @@ -1,3 +1,5 @@
> +:orphan:
> +
>   =====================
>   MSM Crash Dump Format
>   =====================
> diff --git a/Documentation/interconnect/interconnect.rst b/Documentation/interconnect/interconnect.rst
> index c3e004893796..56e331dab70e 100644
> --- a/Documentation/interconnect/interconnect.rst
> +++ b/Documentation/interconnect/interconnect.rst
> @@ -1,5 +1,7 @@
>   .. SPDX-License-Identifier: GPL-2.0
>   
> +:orphan:
> +
>   =====================================
>   GENERIC SYSTEM INTERCONNECT SUBSYSTEM
>   =====================================
> diff --git a/Documentation/laptops/lg-laptop.rst b/Documentation/laptops/lg-laptop.rst
> index aa503ee9b3bc..f2c2ffe31101 100644
> --- a/Documentation/laptops/lg-laptop.rst
> +++ b/Documentation/laptops/lg-laptop.rst
> @@ -1,5 +1,7 @@
>   .. SPDX-License-Identifier: GPL-2.0+
>   
> +:orphan:
> +
>   LG Gram laptop extra features
>   =============================
>   
> diff --git a/Documentation/powerpc/isa-versions.rst b/Documentation/powerpc/isa-versions.rst
> index 812e20cc898c..66c24140ebf1 100644
> --- a/Documentation/powerpc/isa-versions.rst
> +++ b/Documentation/powerpc/isa-versions.rst
> @@ -1,3 +1,5 @@
> +:orphan:
> +
>   CPU to ISA Version Mapping
>   ==========================
>   
> 

-- 
Andrew Donnellan              OzLabs, ADL Canberra
ajd@linux.ibm.com             IBM Australia Limited
