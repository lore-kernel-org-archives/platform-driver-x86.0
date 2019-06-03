From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: Re: [PATCH 09/22] docs: mark orphan documents as such
Date: Mon, 3 Jun 2019 09:32:54 +0200
Message-ID: <2891a08c-50b1-db33-0e96-740d45c5235f@c-s.fr>
References: <cover.1559171394.git.mchehab+samsung@kernel.org>
 <e0bf4e767dd5de9189e5993fbec2f4b1bafd2064.1559171394.git.mchehab+samsung@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <e0bf4e767dd5de9189e5993fbec2f4b1bafd2064.1559171394.git.mchehab+samsung@kernel.org>
Content-Language: fr
Sender: linux-kernel-owner@vger.kernel.org
To: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: kvm@vger.kernel.org, =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@redhat.com>, Maxime Ripard <maxime.ripard@bootlin.com>, dri-devel@lists.freedesktop.org, platform-driver-x86@vger.kernel.org, Paul Mackerras <paulus@samba.org>, linux-stm32@st-md-mailman.stormreply.com, Alexandre Torgue <alexandre.torgue@st.com>, Jonathan Corbet <corbet@lwn.net>, David Airlie <airlied@linux.ie>, Andrew Donnellan <ajd@linux.ibm.com>, linux-pm@vger.kernel.org, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Matan Ziv-Av <matan@svgalib.org>, Mauro Carvalho Chehab <mchehab@infradead.org>, Daniel Vetter <daniel@ffwll.ch>, Sean Paul <sean@poorly.run>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Frederic
List-Id: platform-driver-x86.vger.kernel.org



Le 30/05/2019 à 01:23, Mauro Carvalho Chehab a écrit :
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

Are those files really not meant to be included in a toctree ?

Shouldn't we include them in the relevant toctree instead of just 
shutting up Sphinx warnings ?

Christophe

> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
> ---
>   Documentation/accelerators/ocxl.rst                 | 2 ++
>   Documentation/arm/stm32/overview.rst                | 2 ++
>   Documentation/arm/stm32/stm32f429-overview.rst      | 2 ++
>   Documentation/arm/stm32/stm32f746-overview.rst      | 2 ++
>   Documentation/arm/stm32/stm32f769-overview.rst      | 2 ++
>   Documentation/arm/stm32/stm32h743-overview.rst      | 2 ++
>   Documentation/arm/stm32/stm32mp157-overview.rst     | 2 ++
>   Documentation/gpu/msm-crash-dump.rst                | 2 ++
>   Documentation/interconnect/interconnect.rst         | 2 ++
>   Documentation/laptops/lg-laptop.rst                 | 2 ++
>   Documentation/powerpc/isa-versions.rst              | 2 ++
>   Documentation/virtual/kvm/amd-memory-encryption.rst | 2 ++
>   Documentation/virtual/kvm/vcpu-requests.rst         | 2 ++
>   13 files changed, 26 insertions(+)
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
> diff --git a/Documentation/virtual/kvm/amd-memory-encryption.rst b/Documentation/virtual/kvm/amd-memory-encryption.rst
> index 659bbc093b52..33d697ab8a58 100644
> --- a/Documentation/virtual/kvm/amd-memory-encryption.rst
> +++ b/Documentation/virtual/kvm/amd-memory-encryption.rst
> @@ -1,3 +1,5 @@
> +:orphan:
> +
>   ======================================
>   Secure Encrypted Virtualization (SEV)
>   ======================================
> diff --git a/Documentation/virtual/kvm/vcpu-requests.rst b/Documentation/virtual/kvm/vcpu-requests.rst
> index 5feb3706a7ae..c1807a1b92e6 100644
> --- a/Documentation/virtual/kvm/vcpu-requests.rst
> +++ b/Documentation/virtual/kvm/vcpu-requests.rst
> @@ -1,3 +1,5 @@
> +:orphan:
> +
>   =================
>   KVM VCPU Requests
>   =================
> 
