From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: linux-next: Tree for Oct 2 (dell: dcdbas)
Date: Tue, 2 Oct 2018 09:26:21 -0700
Message-ID: <b019c375-1157-778f-99b2-1d09aa4b4e6a@infradead.org>
References: <20181002191818.1c2eec51@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181002191818.1c2eec51@canb.auug.org.au>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Linux-Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Stuart Hayes <stuart.w.hayes@gmail.com>
List-Id: platform-driver-x86.vger.kernel.org

On 10/2/18 2:18 AM, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20180928:
> 

on i386 or x86_64:

  CC      drivers/platform/x86/dcdbas.o
../drivers/platform/x86/dcdbas.c: In function 'dcdbas_check_wsmt':
../drivers/platform/x86/dcdbas.c:572:2: error: implicit declaration of function 'memremap' [-Werror=implicit-function-declaration]
  eps_buffer = memremap(eps->smm_comm_buff_addr, remap_size, MEMREMAP_WB);
  ^
../drivers/platform/x86/dcdbas.c:572:61: error: 'MEMREMAP_WB' undeclared (first use in this function)
  eps_buffer = memremap(eps->smm_comm_buff_addr, remap_size, MEMREMAP_WB);
                                                             ^
../drivers/platform/x86/dcdbas.c:572:61: note: each undeclared identifier is reported only once for each function it appears in
../drivers/platform/x86/dcdbas.c: In function 'dcdbas_exit':
../drivers/platform/x86/dcdbas.c:748:3: error: implicit declaration of function 'memunmap' [-Werror=implicit-function-declaration]
   memunmap(eps_buffer);
   ^


Reported-by: Randy Dunlap <rdunlap@infradead.org>

-- 
~Randy
