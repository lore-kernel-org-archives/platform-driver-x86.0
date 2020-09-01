From: Mimi Zohar <zohar@linux.ibm.com>
Subject: Re: [PATCH 2/3] integrity: Move import of MokListRT certs to a
 separate routine
Date: Tue, 01 Sep 2020 16:48:50 -0400
Message-ID: <4190d5a54590e16a7612f132c6013f3310f99571.camel@linux.ibm.com>
References: <20200826034455.28707-1-lszubowi@redhat.com>
         <20200826034455.28707-3-lszubowi@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <linux-security-module-owner@vger.kernel.org>
In-Reply-To: <20200826034455.28707-3-lszubowi@redhat.com>
Sender: owner-linux-security-module@vger.kernel.org
To: Lenny Szubowicz <lszubowi@redhat.com>, linux-kernel@vger.kernel.org, linux-efi@vger.kernel.org, platform-driver-x86@vger.kernel.org, linux-security-module@vger.kernel.org, ardb@kernel.org, jmorris@namei.org, serge@hallyn.com, keescook@chromium.org, bp@alien8.de, pjones@redhat.com, dhowells@redhat.com, prarit@redhat.com
List-Id: platform-driver-x86.vger.kernel.org

On Tue, 2020-08-25 at 23:44 -0400, Lenny Szubowicz wrote:
> Move the loading of certs from the UEFI MokListRT into a separate
> routine to facilitate additional MokList functionality.
> 
> There is no visible functional change as a result of this patch.
> Although the UEFI dbx certs are now loaded before the MokList certs,
> they are loaded onto different key rings. So the order of the keys
> on their respective key rings is the same.
> 
> Signed-off-by: Lenny Szubowicz <lszubowi@redhat.com>

Reviewed-by: Mimi Zohar <zohar@linux.ibm.com>
