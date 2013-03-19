From: Hu Tao <hutao@cn.fujitsu.com>
Subject: Re: [PATCH] pvevent: pvevent device driver
Date: Tue, 19 Mar 2013 13:49:10 +0800
Message-ID: <20130319054910.GE23780@localhost.localdomain>
References: <1363251073-20380-1-git-send-email-hutao@cn.fujitsu.com>
	<1363376111.2553.6.camel@x230.sbx07502.somerma.wayport.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <qemu-devel-bounces+gceq-qemu-devel=gmane.org@nongnu.org>
In-Reply-To: <1363376111.2553.6.camel@x230.sbx07502.somerma.wayport.net>
Content-Disposition: inline
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+gceq-qemu-devel=gmane.org@nongnu.org
Sender: qemu-devel-bounces+gceq-qemu-devel=gmane.org@nongnu.org
To: Matthew Garrett <matthew.garrett@nebula.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, Gleb Natapov <gleb@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, Jan Kiszka <jan.kiszka@siemens.com>, qemu-devel <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>, Blue Swirl <blauwirbel@gmail.com>, Orit Wasserman <owasserm@redhat.com>, Juan Quintela <quintela@redhat.com>, Alexander Graf <agraf@suse.de>, Christian Borntraeger <borntraeger@de.ibm.com>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, Andrew Jones <drjones@redhat.com>, Alex Williamson <alex.williamson@redhat.com>, Sasha Levin <levinsasha928@gmail.com>, Stefan Hajnoczi <stefanha@redhat.com>, Luiz Capitulino <lcapitulino@redhat.com>, KAMEZAWA Hiroyuki <kamezawa.hiroyu@jp.fujitsu.com>, Kevin Wolf <kwolf@redhat.com>, Anthony Liguori <aliguori@us.ibm.com>, Marcelo Tosatti <mtosatti@redhat.com>, linux-kernel@vger.kernel.o
List-Id: platform-driver-x86.vger.kernel.org

On Fri, Mar 15, 2013 at 07:35:12PM +0000, Matthew Garrett wrote:
> On Thu, 2013-03-14 at 16:51 +0800, Hu Tao wrote:
> 
> > +	{ "MSFT0001", 0},
> 
> This seems wrong, and it looks like qemu agrees. Can you resubmit when
> there's agreement on the name?

My fault. The name should be "QEMU". I'll send an updated version.

-- 
Regards,
Hu Tao
