From: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Subject: Re: [PATCH v3 06/20] docs: mark orphan documents as such
Date: Tue, 11 Jun 2019 14:05:01 -0300
Message-ID: <20190611140501.11ba091b@coco.lan>
References: <ff457774d46d96e8fe56b45409aba39d87a8672a.1559933665.git.mchehab+samsung@kernel.org>
        <0bea1c7c4fc06c7edabbf3185c0cbbc6e85eafd0.1559933665.git.mchehab+samsung@kernel.org>
        <CAHp75VfTNJOGZx-PoUXLRvzghqf6bVUdJ+yFjE9hNtDLCQ1=UA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAHp75VfTNJOGZx-PoUXLRvzghqf6bVUdJ+yFjE9hNtDLCQ1=UA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Linux Doc Mailing List <linux-doc@vger.kernel.org>, Mauro Carvalho Chehab <mchehab@infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Jonathan Corbet <corbet@lwn.net>, Frederic Barrat <fbarrat@linux.ibm.com>, Andrew Donnellan <ajd@linux.ibm.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <maxime.ripard@bootlin.com>, Sean Paul <sean@poorly.run>, Georgi Djakov <georgi.djakov@linaro.org>, Matan Ziv-Av <matan@svgalib.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
List-Id: platform-driver-x86.vger.kernel.org

Em Tue, 11 Jun 2019 19:52:04 +0300
Andy Shevchenko <andy.shevchenko@gmail.com> escreveu:

> On Fri, Jun 7, 2019 at 10:04 PM Mauro Carvalho Chehab
> <mchehab+samsung@kernel.org> wrote:
> > Sphinx doesn't like orphan documents:  
> 
> >     Documentation/laptops/lg-laptop.rst: WARNING: document isn't included in any toctree  
> 
> >  Documentation/laptops/lg-laptop.rst             | 2 ++  
> 
> > diff --git a/Documentation/laptops/lg-laptop.rst b/Documentation/laptops/lg-laptop.rst
> > index aa503ee9b3bc..f2c2ffe31101 100644
> > --- a/Documentation/laptops/lg-laptop.rst
> > +++ b/Documentation/laptops/lg-laptop.rst
> > @@ -1,5 +1,7 @@
> >  .. SPDX-License-Identifier: GPL-2.0+
> >
> > +:orphan:
> > +
> >  LG Gram laptop extra features
> >  =============================
> >  
> 
> Can we rather create a toc tree there?
> It was a first document in reST format in that folder.

Sure, but:

1) I have a patch converting the other files on this dir to rst:

	https://git.linuxtv.org/mchehab/experimental.git/commit/?h=convert_rst_renames_v4.1&id=abc13233035fdfdbc5ef2f2fbd3d127a1ab15530

2) It probably makes sense to move the entire dir to
Documentation/admin-guide.

So, I would prefer to have the :orphan: here while (1) is not merged.

Thanks,
Mauro
