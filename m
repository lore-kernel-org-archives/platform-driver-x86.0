From: Jonathan Corbet <corbet@lwn.net>
Subject: Re: [PATCH 9/9] platform: x86: get rid of a non-existent document
Date: Fri, 28 Jun 2019 09:01:51 -0600
Message-ID: <20190628090151.486d185e@lwn.net>
References: <cover.1561723736.git.mchehab+samsung@kernel.org>
        <9472251c3ff159b832b4e82d77836c44f89b49b0.1561723736.git.mchehab+samsung@kernel.org>
        <CAHp75VfkWkVvvufTje1G+w=7gjsr7D2On-NsOsOoTEBNLVLJzQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAHp75VfkWkVvvufTje1G+w=7gjsr7D2On-NsOsOoTEBNLVLJzQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, Linux Doc Mailing List <linux-doc@vger.kernel.org>, Mauro Carvalho Chehab <mchehab@infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Fri, 28 Jun 2019 17:49:48 +0300
Andy Shevchenko <andy.shevchenko@gmail.com> wrote:

> On Fri, Jun 28, 2019 at 3:12 PM Mauro Carvalho Chehab
> <mchehab+samsung@kernel.org> wrote:
> >
> > Changeset 163ede97a9a2 ("Documentation: platform: Delete x86-laptop-drivers.txt")
> > removed the x86-laptop-drivers.txt file, but forgot to update its
> > Kconfig.  
> 
> Acked-by: Andy Shevchenko <andy.shevchenko@gmail.com>

The patch that brought this situation into being is in docs-next, so I
applied this one too.

jon
