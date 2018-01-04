From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v6 00/11] Intel SGX Driver
Date: Thu, 4 Jan 2018 15:27:41 +0100
Message-ID: <20180104142741.GA1320@kroah.com>
References: <20171125193132.24321-1-jarkko.sakkinen@linux.intel.com>
 <CALXu0Uf6qOg4-4aEfepD9hxXsbUtayndNC-nWc_Ymc5psCdEwQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CALXu0Uf6qOg4-4aEfepD9hxXsbUtayndNC-nWc_Ymc5psCdEwQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Cedric Blancher <cedric.blancher@gmail.com>
Cc: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>, platform-driver-x86@vger.kernel.org, x86@kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Borislav Petkov <bp@suse.de>, "David S. Miller" <davem@davemloft.net>, Grzegorz Andrejczuk <grzegorz.andrejczuk@intel.com>, Haim Cohen <haim.cohen@intel.com>, Ingo Molnar <mingo@kernel.org>, Janakarajan Natarajan <Janakarajan.Natarajan@amd.com>, Jim Mattson <jmattson@google.com>, Kan Liang <Kan.liang@intel.com>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Kyle Huey <me@kylehuey.com>, Len Brown <len.brown@intel.com>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, "open list:FILESYSTEMS (VFS and infrastructure)" <linux-fsdevel@vger.kernel.org>, Mauro Carvalho Chehab <mchehab@kerne>
List-Id: platform-driver-x86.vger.kernel.org

On Thu, Jan 04, 2018 at 03:17:24PM +0100, Cedric Blancher wrote:
> So how does this protect against the MELTDOWN attack (CVE-2017-5754)
> and the MELTATOMBOMBA4 worm which uses this exploit?

It has nothing to do with it at all, sorry.

greg k-h
