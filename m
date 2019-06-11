From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v3 06/20] docs: mark orphan documents as such
Date: Tue, 11 Jun 2019 19:52:04 +0300
Message-ID: <CAHp75VfTNJOGZx-PoUXLRvzghqf6bVUdJ+yFjE9hNtDLCQ1=UA@mail.gmail.com>
References: <ff457774d46d96e8fe56b45409aba39d87a8672a.1559933665.git.mchehab+samsung@kernel.org>
 <0bea1c7c4fc06c7edabbf3185c0cbbc6e85eafd0.1559933665.git.mchehab+samsung@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <0bea1c7c4fc06c7edabbf3185c0cbbc6e85eafd0.1559933665.git.mchehab+samsung@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Cc: Linux Doc Mailing List <linux-doc@vger.kernel.org>, Mauro Carvalho Chehab <mchehab@infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Jonathan Corbet <corbet@lwn.net>, Frederic Barrat <fbarrat@linux.ibm.com>, Andrew Donnellan <ajd@linux.ibm.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <maxime.ripard@bootlin.com>, Sean Paul <sean@poorly.run>, Georgi Djakov <georgi.djakov@linaro.org>, Matan Ziv-Av <matan@svgalib.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
List-Id: platform-driver-x86.vger.kernel.org

On Fri, Jun 7, 2019 at 10:04 PM Mauro Carvalho Chehab
<mchehab+samsung@kernel.org> wrote:
> Sphinx doesn't like orphan documents:

>     Documentation/laptops/lg-laptop.rst: WARNING: document isn't included in any toctree

>  Documentation/laptops/lg-laptop.rst             | 2 ++

> diff --git a/Documentation/laptops/lg-laptop.rst b/Documentation/laptops/lg-laptop.rst
> index aa503ee9b3bc..f2c2ffe31101 100644
> --- a/Documentation/laptops/lg-laptop.rst
> +++ b/Documentation/laptops/lg-laptop.rst
> @@ -1,5 +1,7 @@
>  .. SPDX-License-Identifier: GPL-2.0+
>
> +:orphan:
> +
>  LG Gram laptop extra features
>  =============================
>

Can we rather create a toc tree there?
It was a first document in reST format in that folder.

-- 
With Best Regards,
Andy Shevchenko
